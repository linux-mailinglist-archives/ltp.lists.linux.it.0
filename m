Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 982D26428B
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:22 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6A3CB3C1C7E
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jul 2019 09:23:22 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 6D6993C0137
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:21 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-4.smtp.seeweb.it (Postfix) with ESMTP id D853E10011D5
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 09:23:15 +0200 (CEST)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hl6wh-0008I5-16
 for ltp@lists.linux.it; Wed, 10 Jul 2019 07:23:19 +0000
Received: by mail-pg1-f199.google.com with SMTP id n7so924046pgr.12
 for <ltp@lists.linux.it>; Wed, 10 Jul 2019 00:23:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=R46JYTFJFs3dUHT6CyNz3XPJOVzqYp0zkAXrC4Wzyjg=;
 b=BHdNiTgYBVdODfSj5wfX+HQxtpxeJeGRZ3gAphJ1uBFCCdj3ZJBksg2rTHMXhf55MR
 4fBm0uzbwwsd9OvgbWiAhCPDhVZ+U0JszIYlCB4hBpIQVu21Pu+sRyN90NGvADCmevyZ
 6/LP6XpL2gm9z6gPjQZlnP3m8IGnEwL5Gb3D3CbGvM8rhDF0VdS/0rM/yoL29yg84250
 W1bA8yNfES/ESQjgEjxzLNuka3nDUsIt09cdMbwy4n0jTVv+WZfr+FP/Jj97RNSGijAY
 /r+Zweap1s2cKn6xrdclgyB9drPe3Z0HvPBvjkqOlWUfFVnVRrdxTQpnflH6zju1uSQg
 zQcQ==
X-Gm-Message-State: APjAAAVnuFD1FvvbGLhc3ahuv10Lj+jnGSsmVezgM+G3GAVN8vVcpZK3
 kMCncb+yYMaalg/5mbp5vJR5BQ2giLI+b6vSusXf8shUQGp68TWiOkoKwMZZFMzBL5MUx2yq8/3
 ZMF6GrCShBbUhQo0TsqZ3SOYieCs=
X-Received: by 2002:a65:4d4e:: with SMTP id j14mr35150078pgt.50.1562743397390; 
 Wed, 10 Jul 2019 00:23:17 -0700 (PDT)
X-Google-Smtp-Source: APXvYqy561Z3qIc7t0Y6vCH4pi1jjR/B0WDCADWnIvGCOpXHKf/GfDSXN6sFnIfm7V6rIJ8DWuLoWg==
X-Received: by 2002:a65:4d4e:: with SMTP id j14mr35150037pgt.50.1562743396829; 
 Wed, 10 Jul 2019 00:23:16 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id h26sm1192653pfq.64.2019.07.10.00.23.15
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 10 Jul 2019 00:23:16 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed, 10 Jul 2019 15:23:02 +0800
Message-Id: <20190710072305.25806-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCHv2 0/3] zram/zram_lib.sh: fix zram_compress_alg() test
 for zram01
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
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

The zram_compress_alg() test in zram01 is not working properly, this
patchset will address the following issues:
  1. Inconsistent variable name for compression algorithms, and the
     algorithm name needs to be sanitized before use.
  2. Hard-coded block device numbers to iterate with. If the number of
     the available zram compression algorithms is larger than the
     number of block devices, the test will fail.
  3. Restore the compression algorithm back to the default one.

Po-Hsu Lin (3):
  zram/zram_lib.sh: fix variable name and algorithm retrieval
  zram/zram_lib.sh: iterate through all available compression algorithms
    for all zram block devices
  zram/zram_lib.sh: set the compression algorithms back to default after
    test

 .../kernel/device-drivers/zram/zram_lib.sh    | 24 +++++++++++++------
 1 file changed, 17 insertions(+), 7 deletions(-)

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
