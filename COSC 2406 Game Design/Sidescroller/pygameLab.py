## Connor Cerisano, Mario Lavoie, Ayden Tucker
## 2020-10-13
## COSC 2406 - Introduction to Game Design and Development
## 2D Sidescroller Lab

## SETUP
import pygame ## For using pygame functions.
import random 

pygame.init() ## Initialize the pygame environment.
pygame.display.set_caption("Lab 1: 2D Sidescroller")
screenWidth = 720
screenHeight = 480
win = pygame.display.set_mode((screenWidth, screenHeight))
pygame.mixer.init()

#Music/sound effects initialized
musec = pygame.mixer.music.load('./lasagna time.wav')
pygame.mixer.music.play(-1)

def bonk():
    pygame.mixer.Sound.play(pygame.mixer.Sound('./fart.wav'))

## VARIABLES
s = 0
TIME_DELAY = 25 ## Control keypress sensitivity
velocity = 8
xposMax = 7200
isJumping = False ## To know if player is in the "air" or not
movingForward = False
jonleft = False
time = 0.0 ## To calculate player's height when jumping
halfScreenWidth = screenWidth / 2

## FONTS
pygame.font.init() 
myfont = pygame.font.SysFont('Comic Sans MS', 30)
timerfont = pygame.font.SysFont('Times New Roman', 30)

## TARGETS
Target = dict()
nTargets = 10 ##number of targets
distanceBetweenTargets = 9 * screenWidth / nTargets
targetName = './Target.png'
asurf = pygame.image.load(targetName)
for i in range(0, nTargets):
    n = random.randint(170,220)
    dictEntryTargets = {'name': targetName,
                 'x': 480 + i * distanceBetweenTargets, ##make uniform
                 'y': n,##make random
                 'width':64,
                 'height':64,
                 'img': asurf,
                 'blit':True,
                 'score':False,
                 'lock':False,
                 'TargetNum':i}
    Target[i] = dictEntryTargets

## AVATAR
AVATAR = {'colour': [255,255,255], 'width': 40, 'height': 75}
player = {'x': screenWidth / 2, 'y': screenHeight / 2, 'name': 'Jon'}
camera = {'x': None, 'y': 0, 'name': 'Camera 0', 'misc': None} ## Camera x-pos relies on player.
jonl = './Cursedjonbutactuallyleftcursedjon.png'
jonr = './CursedJon.png'
goingright = pygame.image.load(jonr)
goingleft = pygame.image.load(jonl)
jonsprite = {'name': jonr,
                 'x': screenWidth,
                 'y': 0,
                 'width':40,
                 'height':60,
                 'img': goingright}

def drawAvatar(avatar): 
    if (jonleft == True):
        jonsprite['name'] = jonl
        jonsprite['img'] = goingleft

    if (jonleft == False):
        jonsprite['name'] = jonr
        jonsprite['img'] = goingright

    win.blit(jonsprite['img'], (screenWidth/2 - int(avatar['width']/2),
                     398 - int(avatar['height']/2),
                     avatar['width'],
                     avatar['height']))

## BACKGROUND IMAGES
BG = dict() ## Add images to dictionary. (key,name, xy position, colour)
nBG = 10 ## Number of backgrounds
for i in range(0, nBG):
    imageName = './Bck_' + str(i) + '.png' ## Set the input path.
    asurf = pygame.image.load(imageName) ## Load the image onto a surface.
    ## Set up a dictionary, add image as an entry. Dictionaries can contain multiple entries.
    dictEntry = {'name': imageName,
                 'x': i * screenWidth,
                 'y': 0,
                 'img': asurf}
    BG[i] = dictEntry

## clamp(x) = x if xmin <= x <= xmax, xmin if x < xmin, xmax if x > xmax
def clamp(x,xmin,xmax):
    if (x > xmax): return xmax
    elif (x < xmin): return xmin
    else: return x

RUN = True
DRAW = True

## MAIN GAME LOOP #####################################################################################
while (RUN):
    ticks = pygame.time.get_ticks() ## Update time

    if (player['x'] < xposMax):
        ## find correct images to display, based on starting position
        camera['x'] = clamp(player['x'], halfScreenWidth, nBG * screenWidth - halfScreenWidth)
        it = 0 
        while ((camera['x'] - BG[it]['x']) >= screenWidth):
            it += 1
        xpos = BG[it]['x'] - camera['x'] + halfScreenWidth ## Set the x position. 
        
        ## Draw the image at the proper location.
        if (DRAW):
            win.blit(BG[it]['img'], (BG[it]['x'] - camera['x'] + halfScreenWidth, BG[it]['y']))

            ## Draw previous or next image if necessary. If xpos=0, only one image needs to be drawn.
            if (xpos != 0):
                if (xpos < 0):
                    it +=1 ## Next image needs to be drawn.
                else:
                    it -= 1 ## Previous image needs to be drawn.
                ## Draw the other image.
                win.blit(BG[it]['img'], (BG[it]['x'] - camera['x'] + halfScreenWidth, BG[it]['y']))

            ##draw targets
            for i in range(0,nTargets):
                if (Target[i]['blit']==True):
                    win.blit(Target[i]['img'], (Target[i]['x'] - camera['x'] + halfScreenWidth, Target[i]['y']))
            
            ## Draw the avatar last, ontop of the images.
            drawAvatar(AVATAR)

    win.blit(BG[it]['img'], (BG[it]['x'] - camera['x'] + halfScreenWidth, BG[it]['y']))

    ## Draw game objects
    drawAvatar(AVATAR)
    win.blit(timerfont.render('Time: ' + str(ticks/1000), False, (0,0,0)), (20,10))
    win.blit(myfont.render('Score = ' + str(s), False, (0,0,0)), (560,10))
    
    ## DEBUG STUFF (feel free to remove this later)
    debugfont = pygame.font.SysFont('Times New Roman', 17)
    win.blit(debugfont.render('playerX = ' + str(player['x']), False, (0,0,0)), (10,70))
    win.blit(debugfont.render('playerY = ' + str(player['y']), False, (0,0,0)), (10,90))
    win.blit(debugfont.render('cameraX = ' + str(camera['x']), False, (0,0,0)), (10,110))
    win.blit(debugfont.render('cameraY = ' + str(camera['y']), False, (0,0,0)), (10,130))
    win.blit(debugfont.render('avatarWidth = ' + str(AVATAR['width']), False, (0,0,0)), (10,150))
    win.blit(debugfont.render('avatarHeight = ' + str(AVATAR['height']), False, (0,0,0)), (10,170))
    fontLocation = 50
    for i in range(0, nTargets):
        fontLocation = fontLocation + 20
        win.blit(debugfont.render('target' + str(i) + 'X = ' + str(Target[i]['x']), False, (0,0,0)), (580,fontLocation))
        fontLocation = fontLocation + 15
        win.blit(debugfont.render('target' + str(i) + 'Y = ' + str(Target[i]['y']), False, (0,0,0)), (580,fontLocation))

    ## TARGET / SCORE
    for i in range(0,nTargets):
                if (Target[i]['blit']==True):
                    win.blit(Target[i]['img'], (Target[i]['x'] - camera['x'] + halfScreenWidth, Target[i]['y']))
                if (Target[i]['score']==True and Target[i]['lock']==False):
                    s+=1
                    bonk()
                    Target[i]['score']=False
                    Target[i]['lock']=True

    ## CHECK FOR EVENTS
    for event in pygame.event.get():
        if event.type == pygame.QUIT:
            RUN = False
    if ((ticks/1000) >= 90):
        print('game ended')
        pygame.quit()

    ## UPDATE DISPLAY    
    pygame.display.update()
    pygame.time.delay(TIME_DELAY) ## Decrease sensitivity

    ## Player Movement
    keys = pygame.key.get_pressed() ## Check input
    if (keys[pygame.K_LEFT]):
        player['x'] -= velocity
        jonleft = True
        movingForward = False ## Left is not forward.
    elif (keys[pygame.K_RIGHT]):
        player['x'] += velocity
        jonleft = False
        movingForward = True
    elif (keys[pygame.K_ESCAPE]):
        RUN = False
    else: ##If player is not moving, they are not moving forward
        movingForward = False

## PLAYER JUMPING SYSTEM
    ## Calculate character's height as a function of time
    AVATAR['height'] = 76 + (-time)*(time - 45)
    ## Ensure time will keep calculating until player hits ground
    if (isJumping == False and keys[pygame.K_UP]):
        isJumping = True
    if (isJumping == True):
        time = time + 1
        DRAW = True
    ## Keep player on ground after a jump
    if (AVATAR['height'] < 75):
        time = 0
        isJumping = False
        AVATAR['height'] = 75

##Colision detection
    ##might need to do 10 if statements
    ##because only register x value
    ##loop for every target
    for i in range(0, nTargets):
        if (player['x'] < Target[i]['x'] + Target[i]['width'] and
            player['x'] + jonsprite['width'] > Target[i]['x'] and
            AVATAR['height'] < Target[i]['y'] + Target[i]['height'] and
            AVATAR['height'] + jonsprite['height'] > Target[i]['y'] and
            movingForward == True):
            Target[i]['blit'] = False
            Target[i]['score'] = True ## update score, cant be reused
             
    ## Ensure the player stays in the game world
    player['x'] = clamp(player['x'], halfScreenWidth, xposMax)

## Exit the pygame environment
pygame.quit()
