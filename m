Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D270E324273
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:44 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 852D73C59A2
	for <lists+linux-ltp@lfdr.de>; Wed, 24 Feb 2021 17:49:44 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 by picard.linux.it (Postfix) with ESMTP id C39063C59A2
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:22 +0100 (CET)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 58044200DFE
 for <ltp@lists.linux.it>; Wed, 24 Feb 2021 17:49:22 +0100 (CET)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 79528ADDB;
 Wed, 24 Feb 2021 16:49:21 +0000 (UTC)
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Wed, 24 Feb 2021 17:50:40 +0100
Message-Id: <20210224165045.17738-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.26.2
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/5] Another attempt at hardware discovery
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Michal Simek <michals@xilinx.com>, Carlos Hernandez <ceh@ti.com>,
 automated-testing@yoctoproject.org, Orson Zhai <orsonzhai@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

This is a second attempt on hardware discovery LTP support. The main
difference between the previous attempts is that this version uses JSON,
which allows us propagate structured data to the test.

This is still an early protototype but I'm seding it out to get more
feedback before I continue to work on it.

So how is this supposed to work:

* Test that needs particular hardware sets the needs_hardware filed in
  the test test structure. This is a free form string, in the uart
  example it's called 'UART-loopback'. If we ever add a test for i2c
  eeprom it would be probably called 'I2C-eeprom', etc.

* The test library takes this and passes it to the hardware discovery
  script/binary. The example scipt that is included in this patchset
  just hardcodes configuration for a usb-to-serial cable. In real world
  lab this would be either prepared for each board specifically and
  injected to the filesystem before the test happens, or may be a simple
  script that calls curl with a request to a lab sever, etc.

* The output from the script is a JSON object. If there is a need to
  reconfigure lab hardware before the test, the JSON contains a path to
  a script/binary that has to be called to do so. Again this may be a
  script that calls curl with a request to a lab sever which would, for
  example, interconnect different serial ports with relays.

  The parameter to that script is an unique ID for the hardware
  configuration that is listed in each hardware configuration in the
  hwconfs array of objects that follows.

  I'm not sure if this actually belongs there, maybe it would be
  cleaner to have one reconfigure script for the whole LTP and we would
  pass the needs_hardware content as well as the unique ID, e.g.

  'hardware-reconfigure.sh UART-loopback ttyUSB0-ttyS0'

  but that is a minor detail that could be easily sorted out later.


  The most important part of the JSON is the hwconfs array, which
  consists of hardware description objects, which, apart form the uid,
  are not interpreted by the library, but rather passed to the test. The
  test library loops over the array and forks a testrun for each entry
  in the array.

  Each iteration of the test then gets it's parameters as a JSON object.
  In the case of the UART one of the objects in the array looks like:

  {
    "uid": "ttyUSB0-ttyUSB0-01",
    "rx": "ttyUSB0",
    "tx": "ttyUSB0",
    "hwflow": 0,
    "baud_rates": [
     9600,
     19200
    ]
  }

  Which is mostly self-explanatory, the test then parses the structure
  and executes one test per each baud rate.

  What is still missing is the ability to pass the JSON hardware
  description directly to the test, so that we can execute the test
  manually, but that would be fairly easy to add.

Cyril Hrubis (5):
  lib: tst_cmd: Make tst_cmd() usable for global paths
  lib: Add minimalistic json parser
  lib: Add hardware discovery code
  Sample hardware discovery and reconfigure scripts
  testcases: uart01: Add.

 hardware-discovery.sh                         |  36 +
 hardware-reconfigure.sh                       |   3 +
 include/tst_hwconf.h                          |  13 +
 include/tst_json.h                            | 177 +++++
 include/tst_test.h                            |   3 +
 lib/tst_cmd.c                                 |   2 +-
 lib/tst_hardware.c                            | 218 ++++++
 lib/tst_hardware.h                            |  83 +++
 lib/tst_json.c                                | 679 ++++++++++++++++++
 lib/tst_test.c                                |  30 +
 runtest/device_drivers                        |   2 +
 testcases/kernel/device-drivers/Makefile      |   1 +
 .../kernel/device-drivers/uart/.gitignore     |   1 +
 testcases/kernel/device-drivers/uart/Makefile |   3 +
 testcases/kernel/device-drivers/uart/uart01.c | 620 ++++++++++++++++
 15 files changed, 1870 insertions(+), 1 deletion(-)
 create mode 100755 hardware-discovery.sh
 create mode 100755 hardware-reconfigure.sh
 create mode 100644 include/tst_hwconf.h
 create mode 100644 include/tst_json.h
 create mode 100644 lib/tst_hardware.c
 create mode 100644 lib/tst_hardware.h
 create mode 100644 lib/tst_json.c
 create mode 100644 runtest/device_drivers
 create mode 100644 testcases/kernel/device-drivers/uart/.gitignore
 create mode 100644 testcases/kernel/device-drivers/uart/Makefile
 create mode 100644 testcases/kernel/device-drivers/uart/uart01.c

-- 
2.26.2


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
