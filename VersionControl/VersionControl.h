//
//  VersionControl.h
//  VersionControl
//
//  Created by Simone Fantini on 23/04/14.
//  Copyright (c) 2014 BSDSoftware. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface VersionControl : NSObject

/**
 *  Numero di versione dell'applicazione
 */
@property (nonatomic, readonly) NSString *currentVersion;

typedef void(^VersionBlock)(BOOL isNewInstall);

/**
 *  Esegue il blocco di codice specificato per una specifica versione.
 *
 *  @param block   Blocco di codice da eseguire per la versione.
 *  @param version Numero di versione per cui eseguire il blocco.
 */
- (void)executeBlock:(VersionBlock)block forVersion:(NSString *)version;

/**
 *  Reinizializza la 'cache' delle versioni. 
 *  Ciò può portare alla riesecuzione di un blocco già eseguito per una determinata versione!
 */
- (void)reset;

@end
