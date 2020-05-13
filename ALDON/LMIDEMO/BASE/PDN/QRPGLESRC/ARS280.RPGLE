     h dftactgrp(*no) actgrp(*caller)  thread(*serialize)
      //
     d crtString       PR              o   EXTPROC(*JAVA:
     d                                     'java.lang.String':
     d                                     *CONSTRUCTOR)
     d RPGBytes                      30A   Const Varying
      //
      // Prototype for Java String's getBytes method abcds
      //
     d cvtToBytes      PR            30A   EXTPROC(*JAVA:
     d                                     'java.lang.String':
     d                                     'getBytes')
     d                                     Varying
      //
      // Item object
     d Item            s               o   Class(*JAVA:'com.RpgToJava1.Item')
      //
      // Prototype for Item object
     d crtItem         PR              o   EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.Item':
     d                                     *CONSTRUCTOR)
      //
      // Prototype for Item's Description1 Method
     d getDesc1        PR              o   EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.Item':
     d                                     'getDescription1')
     d                                     Class (*JAVA:'java.lang.String')
      //
      // Prototype for Item's Description1 Method
     d getDesc2        PR              o   EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.Item':
     d                                     'getDescription2')
     d                                     Class (*JAVA:'java.lang.String')
      //
      // Prototype for Item's Description1 Method
     d getPrice        PR            10I 0 EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.Item':
     d                                     'getPrice')
      //
      // GetItem object
     d GetItem         s               o   Class(*JAVA:'com.RpgToJava1.GetItem')
      //
      // Prototype for GetItem object
     d crtGetItem      PR              o   EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.GetItem':
     d                                     *CONSTRUCTOR)
      // Prototype for GetItem's GetItemInfo Method
     d getItemInfo     PR              o   EXTPROC(*JAVA:
     d                                     'com.RpgToJava1.GetItem':
     d                                     'getItemInfo')
     d                                     Class (*JAVA:'com.RpgToJava1.Item')
      //
     d String                          o   Class (*JAVA:'java.lang.String')
     d                                     Const
      //
     d $item_          s               o   Class(*JAVA:'java.lang.String')
     d $desc1_         s               o   Class(*JAVA:'java.lang.String')
     d $desc2_         s               o   Class(*JAVA:'java.lang.String')
      //
     d $desc1          s             30a
     d $desc2          s             30a
     d $price          s             10s 0
      //
      //
      //******************************************************************
      // *ENTRY PLIST
      //*******************************************************************
     D ENTRY_PLIST     PR                  EXTPGM('RPGFREEJV')
     D                               30A
     D
     D ENTRY_PLIST     PI
     D  $Item                        30A
     D
      //
      // Main Routine
      //
     C/free

       $item_ = crtString(%trim($item));
       Item = crtItem();
       GetItem = crtGetItem();

       Item = getItemInfo(GetItem:$item_);

       $desc1_ = getDesc1(Item);
       $desc2_ = getDesc2(Item);
       $price  = getPrice(Item);

       $desc1 = cvtToBytes($desc1_);
       $desc2 = cvtToBytes($desc2_);

       dsply ($desc1);
       dsply ($desc2);
       dsply ($price);

       *inlr = *on;

       Return;

      /end-free
      //
      //
