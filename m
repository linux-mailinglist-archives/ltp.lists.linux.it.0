Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 053FA39774A
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 17:55:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AA9ED3C8042
	for <lists+linux-ltp@lfdr.de>; Tue,  1 Jun 2021 17:55:15 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DC1B53C2926
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 17:55:14 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id E4469200D24
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 17:55:11 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1622562910;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding;
 bh=WjV1Z7oy8iVMuW2BwZ2wu/gcLIWYqwtCDfigUrM7CcE=;
 b=KrJhhpv+NxpYbOnIkK3cunUwCdED95D5Z05Nz+M8NdNM2K05+clDv7GyfYpxp/6zxc/Pb9
 2TQrLku14E7k+VXEMr/gho4mXanti3KDTTod5y81nOTonCCErXZlzSVHk7htIM3eXiNZDf
 CLTajrKVaTog6ZeHFPjYmZNbkrdTm60=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-80-tmIPGRrXNH2whEBs85Q8Og-1; Tue, 01 Jun 2021 11:55:07 -0400
X-MC-Unique: tmIPGRrXNH2whEBs85Q8Og-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.phx2.redhat.com
 [10.5.11.12])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mimecast-mx01.redhat.com (Postfix) with ESMTPS id ED82880BCB7
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 15:54:32 +0000 (UTC)
Received: from zlang-laptop.redhat.com (ovpn-12-89.pek2.redhat.com
 [10.72.12.89])
 by smtp.corp.redhat.com (Postfix) with ESMTP id BB21F60C0F
 for <ltp@lists.linux.it>; Tue,  1 Jun 2021 15:54:30 +0000 (UTC)
From: Zorro Lang <zlang@redhat.com>
To: ltp@lists.linux.it
Date: Tue,  1 Jun 2021 23:54:27 +0800
Message-Id: <20210601155427.996321-1-zlang@redhat.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.12
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=zlang@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH] ltp-aiodio: help aiodio test work normally
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

ltp aiodio related cmdfiles (runtest/ltp-aio*.part*) can't be used,
due to they have unfixed path name. Before we run aiodio test, we
need to create some files (e.g. junkfile), and give it to the tests.
But current cmdfiles use too many $TMPDIR and aiodio.$$ things, e.g:

  AD022 time aiocp -b 1k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2

TMPDIR is a directory created by `mktemp ${TMPBASE}/ltp-XXXXXXXXXX`,
it's not a fixed path. The aiodio.$$ is also can be sure before
running ltp. That cause we can't prepare files in the unfixed path.
Even the testscripts/ltp-aiodio.sh can't work well either, due to it
try to create files in $TMP/aiodio/..., the $TMP is $TMPBASE, not
$TMPDIR, and aiodio is not aiodio.$$.

So this patch trys to help runtest/ltp-aio*.part* to use fixed path
name, and put all aiodio test related files in $TMPBASE/aiodio/, the
$TMPBASE is a fixed pathname comes from runltp -d <directory> option.
So after this fix, users will know where they should create files in,
no matter running ltp-aiodio.sh or runltp -f runtest/ltp-aio*.part*.

Signed-off-by: Zorro Lang <zlang@redhat.com>
---
 runtest/ltp-aio-stress.part1 | 102 ++++-----
 runtest/ltp-aio-stress.part2 |  20 +-
 runtest/ltp-aiodio.part1     | 428 +++++++++++++++++------------------
 runtest/ltp-aiodio.part3     |  96 ++++----
 runtest/ltp-aiodio.part4     |  28 +--
 testscripts/ltp-aiodio.sh    |  43 ++--
 6 files changed, 355 insertions(+), 362 deletions(-)

diff --git a/runtest/ltp-aio-stress.part1 b/runtest/ltp-aio-stress.part1
index a770a40ae..8988a844e 100644
--- a/runtest/ltp-aio-stress.part1
+++ b/runtest/ltp-aio-stress.part1
@@ -26,54 +26,54 @@
 #       -x turn off thread stonewalling
 #       -h this message
 #
-ADS1000 aio-stress -I500  -o2 -S -r4   $TMPDIR/file1
-ADS1001 aio-stress -I500  -o2 -S -r8   $TMPDIR/file1
-ADS1002 aio-stress -I500  -o2 -S -r16  $TMPDIR/file1
-ADS1003 aio-stress -I500  -o2 -S -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1004 aio-stress -I500  -o2 -S -r64   $TMPDIR/junkfile $TMPDIR/file2
-ADS1005 aio-stress -I500  -o3 -S -r4    $TMPDIR/junkfile $TMPDIR/file2
-ADS1006 aio-stress -I500  -o3 -S -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1007 aio-stress -I500  -o3 -S -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1008 aio-stress -I500  -o3 -S -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1009 aio-stress -I500  -o3 -S -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1010 aio-stress -I500  -o3 -S -r128 -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4
-ADS1011 aio-stress -I500  -o3 -S -r256 -t8  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1012 aio-stress -I500  -o3 -S -r512 -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1013 aio-stress -I500  -o2 -O -r4    -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3  $TMPDIR/file4 $TMPDIR/file5  $TMPDIR/file6 $TMPDIR/file7  $TMPDIR/file8
-ADS1014 aio-stress -I500  -o2 -O -r8         $TMPDIR/file1 $TMPDIR/file2
-ADS1015 aio-stress -I500  -o2 -O -r16        $TMPDIR/file1 $TMPDIR/file2
-ADS1016 aio-stress -I500  -o2 -O -r32   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1017 aio-stress -I500  -o2 -O -r64   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1018 aio-stress -I500  -o3 -O -r4    -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1019 aio-stress -I500  -o3 -O -r8    -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1020 aio-stress -I500  -o3 -O -r16   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS1021 aio-stress -I500  -o3 -O -r32   -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1022 aio-stress -I500  -o3 -O -r64   -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1023 aio-stress -I500  -o3 -O -r128  -t4  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1024 aio-stress -I500  -o3 -O -r256  -t8  $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1025 aio-stress -I500  -o3 -O -r512  -t8  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1026 aio-stress -I500  -o0 -S -r4    -t8  $TMPDIR/junkfile $TMPDIR/file2       $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1027 aio-stress -I500  -o0 -S -r8           $TMPDIR/file2
-ADS1028 aio-stress -I500  -o0 -S -r16          $TMPDIR/file2
-ADS1029 aio-stress -I500  -o0 -S -r32   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1030 aio-stress -I500  -o0 -S -r64   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1031 aio-stress -I500  -o1 -S -r4    -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1032 aio-stress -I500  -o1 -S -r8    -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1033 aio-stress -I500  -o1 -S -r16   -t2    $TMPDIR/junkfile $TMPDIR/file2
-ADS1034 aio-stress -I500  -o1 -S -r32   -t4    $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8
-ADS1035 aio-stress -I500  -o1 -S -r64   -t4    $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1036 aio-stress -I500  -o1 -S -r128  -t4    $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1037 aio-stress -I500  -o1 -S -r256  -t8  $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1038 aio-stress -I500  -o1 -S -r512  -t8  -x $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1039 aio-stress -I500  -o1 -O -r4    -t8  -x  $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1040 aio-stress -I500  -o1 -O -r8    -t2  -x $TMPDIR/junkfile $TMPDIR/file2
-ADS1041 aio-stress -I500  -o1 -O -r16   -t2  -x  $TMPDIR/junkfile $TMPDIR/file2
-ADS1042 aio-stress -I500  -o1 -O -r32   -t2   $TMPDIR/junkfile $TMPDIR/file2
-ADS1043 aio-stress -I500  -o1 -O -r64   -t2   $TMPDIR/junkfile $TMPDIR/file2
-ADS1044 aio-stress -I500  -o1 -O -r4    -t4   $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8
-ADS1045 aio-stress -I500  -o1 -O -r8    -t4   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1046 aio-stress -I500  -o1 -O -r16   -t4   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8
-ADS1047 aio-stress -I500  -o1 -O -r32   -t8   $TMPDIR/junkfile $TMPDIR/file2     $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file4  $TMPDIR/file3  $TMPDIR/file5  $TMPDIR/file6
-ADS1048 aio-stress -I500  -o1 -O -r64   -t8   $TMPDIR/junkfile $TMPDIR/file2  $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1049 aio-stress -I500  -o1 -O -r128  -t8   $TMPDIR/junkfile $TMPDIR/file2        $TMPDIR/file7  $TMPDIR/file8 $TMPDIR/file3  $TMPDIR/file4  $TMPDIR/file5  $TMPDIR/file6
-ADS1050 aio-stress -I500  -o1 -O -r256  -t2   $TMPDIR/junkfile $TMPDIR/file2
+ADS1000 aio-stress -I500  -o2 -S -r4   $TMPBASE/aiodio/file1
+ADS1001 aio-stress -I500  -o2 -S -r8   $TMPBASE/aiodio/file1
+ADS1002 aio-stress -I500  -o2 -S -r16  $TMPBASE/aiodio/file1
+ADS1003 aio-stress -I500  -o2 -S -r32  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1004 aio-stress -I500  -o2 -S -r64   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1005 aio-stress -I500  -o3 -S -r4    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1006 aio-stress -I500  -o3 -S -r8   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1007 aio-stress -I500  -o3 -S -r16  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1008 aio-stress -I500  -o3 -S -r32  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4
+ADS1009 aio-stress -I500  -o3 -S -r64  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4
+ADS1010 aio-stress -I500  -o3 -S -r128 -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4
+ADS1011 aio-stress -I500  -o3 -S -r256 -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4 $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6 $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1012 aio-stress -I500  -o3 -S -r512 -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4 $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6 $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1013 aio-stress -I500  -o2 -O -r4    -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4 $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6 $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1014 aio-stress -I500  -o2 -O -r8         $TMPBASE/aiodio/file1 $TMPBASE/aiodio/file2
+ADS1015 aio-stress -I500  -o2 -O -r16        $TMPBASE/aiodio/file1 $TMPBASE/aiodio/file2
+ADS1016 aio-stress -I500  -o2 -O -r32   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1017 aio-stress -I500  -o2 -O -r64   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1018 aio-stress -I500  -o3 -O -r4    -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1019 aio-stress -I500  -o3 -O -r8    -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1020 aio-stress -I500  -o3 -O -r16   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1021 aio-stress -I500  -o3 -O -r32   -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1022 aio-stress -I500  -o3 -O -r64   -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1023 aio-stress -I500  -o3 -O -r128  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1024 aio-stress -I500  -o3 -O -r256  -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1025 aio-stress -I500  -o3 -O -r512  -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1026 aio-stress -I500  -o0 -S -r4    -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2       $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1027 aio-stress -I500  -o0 -S -r8           $TMPBASE/aiodio/file2
+ADS1028 aio-stress -I500  -o0 -S -r16          $TMPBASE/aiodio/file2
+ADS1029 aio-stress -I500  -o0 -S -r32   -t2    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1030 aio-stress -I500  -o0 -S -r64   -t2    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1031 aio-stress -I500  -o1 -S -r4    -t2    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1032 aio-stress -I500  -o1 -S -r8    -t2    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1033 aio-stress -I500  -o1 -S -r16   -t2    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1034 aio-stress -I500  -o1 -S -r32   -t4    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1035 aio-stress -I500  -o1 -S -r64   -t4    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1036 aio-stress -I500  -o1 -S -r128  -t4    $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1037 aio-stress -I500  -o1 -S -r256  -t8  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1038 aio-stress -I500  -o1 -S -r512  -t8  -x $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1039 aio-stress -I500  -o1 -O -r4    -t8  -x  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2        $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1040 aio-stress -I500  -o1 -O -r8    -t2  -x $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1041 aio-stress -I500  -o1 -O -r16   -t2  -x  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1042 aio-stress -I500  -o1 -O -r32   -t2   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1043 aio-stress -I500  -o1 -O -r64   -t2   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS1044 aio-stress -I500  -o1 -O -r4    -t4   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2        $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1045 aio-stress -I500  -o1 -O -r8    -t4   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1046 aio-stress -I500  -o1 -O -r16   -t4   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8
+ADS1047 aio-stress -I500  -o1 -O -r32   -t8   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2     $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1048 aio-stress -I500  -o1 -O -r64   -t8   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2  $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1049 aio-stress -I500  -o1 -O -r128  -t8   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2        $TMPBASE/aiodio/file7  $TMPBASE/aiodio/file8 $TMPBASE/aiodio/file3  $TMPBASE/aiodio/file4  $TMPBASE/aiodio/file5  $TMPBASE/aiodio/file6
+ADS1050 aio-stress -I500  -o1 -O -r256  -t2   $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
diff --git a/runtest/ltp-aio-stress.part2 b/runtest/ltp-aio-stress.part2
index 3a60e23e9..98ca41c15 100644
--- a/runtest/ltp-aio-stress.part2
+++ b/runtest/ltp-aio-stress.part2
@@ -26,13 +26,13 @@
 #       -x turn off thread stonewalling
 #       -h this message
 #
-ADS2001 aio-stress -I500  -o2 -S -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2002 aio-stress -I500  -o3 -S -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2003 aio-stress -I500  -o3 -S -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2004 aio-stress -I500  -o3 -S -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2005 aio-stress -I500  -o3 -S -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2006 aio-stress -I500  -o2 -O -r32  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2007 aio-stress -I500  -o3 -O -r8   -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2008 aio-stress -I500  -o3 -O -r16  -t2  $TMPDIR/junkfile $TMPDIR/file2
-ADS2009 aio-stress -I500  -o3 -O -r32  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
-ADS2010 aio-stress -I500  -o3 -O -r64  -t4  $TMPDIR/junkfile $TMPDIR/file2 $TMPDIR/file3 $TMPDIR/file4
+ADS2001 aio-stress -I500  -o2 -S -r32  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2002 aio-stress -I500  -o3 -S -r8   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2003 aio-stress -I500  -o3 -S -r16  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2004 aio-stress -I500  -o3 -S -r32  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3 $TMPBASE/aiodio/file4
+ADS2005 aio-stress -I500  -o3 -S -r64  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3 $TMPBASE/aiodio/file4
+ADS2006 aio-stress -I500  -o2 -O -r32  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2007 aio-stress -I500  -o3 -O -r8   -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2008 aio-stress -I500  -o3 -O -r16  -t2  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2
+ADS2009 aio-stress -I500  -o3 -O -r32  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3 $TMPBASE/aiodio/file4
+ADS2010 aio-stress -I500  -o3 -O -r64  -t4  $TMPBASE/aiodio/junkfile $TMPBASE/aiodio/file2 $TMPBASE/aiodio/file3 $TMPBASE/aiodio/file4
diff --git a/runtest/ltp-aiodio.part1 b/runtest/ltp-aiodio.part1
index 0338e1858..461a46d0d 100644
--- a/runtest/ltp-aiodio.part1
+++ b/runtest/ltp-aiodio.part1
@@ -1,216 +1,216 @@
 #DESCRIPTION:ltp A-sync IO and Direct IO tests
 #
-AD001 time aiocp -b 1k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD002 time aiocp -b 1k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD003 time aiocp -b 1k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD004 time aiocp -b 1k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD005 time aiocp -b 1k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD006 time aiocp -b 1k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD007 time aiocp -b 1k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD008 time aiocp -b 1k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD009 time aiocp -b 1k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD010 time aiocp -b 1k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD012 time aiocp -b 1k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD013 time aiocp -b 1k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD014 time aiocp -b 1k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD015 time aiocp -b 1k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD016 time aiocp -b 1k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD017 time aiocp -b 1k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD018 time aiocp -b 1k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD019 time aiocp -b 1k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD020 time aiocp -b 1k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD021 time aiocp -b 1k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD022 time aiocp -b 1k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD023 time aiocp -b 2k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD024 time aiocp -b 2k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD025 time aiocp -b 2k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD026 time aiocp -b 2k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD027 time aiocp -b 2k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD028 time aiocp -b 2k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD029 time aiocp -b 2k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD030 time aiocp -b 2k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD031 time aiocp -b 2k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD032 time aiocp -b 2k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD033 time aiocp -b 2k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD034 time aiocp -b 2k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD035 time aiocp -b 2k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD036 time aiocp -b 2k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD037 time aiocp -b 2k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD038 time aiocp -b 2k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD039 time aiocp -b 2k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD040 time aiocp -b 2k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD041 time aiocp -b 2k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD042 time aiocp -b 2k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD043 time aiocp -b 2k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD044 time aiocp -b 4k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD045 time aiocp -b 4k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD046 time aiocp -b 4k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD047 time aiocp -b 4k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD048 time aiocp -b 4k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD049 time aiocp -b 4k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD050 time aiocp -b 4k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD051 time aiocp -b 4k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD052 time aiocp -b 4k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD053 time aiocp -b 4k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD054 time aiocp -b 4k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD055 time aiocp -b 4k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD056 time aiocp -b 4k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD057 time aiocp -b 4k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD058 time aiocp -b 4k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD059 time aiocp -b 4k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD060 time aiocp -b 4k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD061 time aiocp -b 4k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD062 time aiocp -b 4k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD063 time aiocp -b 4k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD064 time aiocp -b 41k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD065 time aiocp -b 8k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD066 time aiocp -b 8k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD067 time aiocp -b 8k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD068 time aiocp -b 8k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD069 time aiocp -b 8k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD070 time aiocp -b 8k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD071 time aiocp -b 8k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD072 time aiocp -b 8k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD073 time aiocp -b 8k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD074 time aiocp -b 8k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD075 time aiocp -b 8k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD076 time aiocp -b 8k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD077 time aiocp -b 8k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD078 time aiocp -b 8k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD079 time aiocp -b 8k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD080 time aiocp -b 8k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD081 time aiocp -b 8k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD082 time aiocp -b 8k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD083 time aiocp -b 8k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD084 time aiocp -b 8k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD085 time aiocp -b 8k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD086 time aiocp -b 16k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD087 time aiocp -b 16k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD088 time aiocp -b 16k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD089 time aiocp -b 16k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD090 time aiocp -b 16k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD091 time aiocp -b 16k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD092 time aiocp -b 16k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD093 time aiocp -b 16k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD094 time aiocp -b 16k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD095 time aiocp -b 16k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD096 time aiocp -b 16k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD097 time aiocp -b 16k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD098 time aiocp -b 16k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD099 time aiocp -b 16k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD101 time aiocp -b 16k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD102 time aiocp -b 16k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD103 time aiocp -b 16k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD104 time aiocp -b 16k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD105 time aiocp -b 16k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD106 time aiocp -b 16k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD107 time aiocp -b 16k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD108 time aiocp -b 32k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD109 time aiocp -b 32k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD110 time aiocp -b 32k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD112 time aiocp -b 32k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD113 time aiocp -b 32k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD114 time aiocp -b 32k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD115 time aiocp -b 32k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD116 time aiocp -b 32k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD117 time aiocp -b 32k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD118 time aiocp -b 32k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD119 time aiocp -b 32k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD120 time aiocp -b 32k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD121 time aiocp -b 32k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD122 time aiocp -b 32k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD123 time aiocp -b 32k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD124 time aiocp -b 32k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD125 time aiocp -b 32k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD126 time aiocp -b 32k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD127 time aiocp -b 32k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD128 time aiocp -b 32k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD129 time aiocp -b 32k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD130 time aiocp -b 64k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD131 time aiocp -b 64k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD132 time aiocp -b 64k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD133 time aiocp -b 64k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD134 time aiocp -b 64k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD135 time aiocp -b 64k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD136 time aiocp -b 64k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD137 time aiocp -b 64k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD138 time aiocp -b 64k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD139 time aiocp -b 64k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD140 time aiocp -b 64k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD141 time aiocp -b 64k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD142 time aiocp -b 64k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD143 time aiocp -b 64k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD144 time aiocp -b 64k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD145 time aiocp -b 64k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD146 time aiocp -b 64k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD147 time aiocp -b 64k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD148 time aiocp -b 64k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD149 time aiocp -b 64k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD150 time aiocp -b 64k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD151 time aiocp -b 128k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD152 time aiocp -b 128k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD153 time aiocp -b 128k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD154 time aiocp -b 128k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD155 time aiocp -b 128k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD156 time aiocp -b 128k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD157 time aiocp -b 128k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD158 time aiocp -b 128k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD159 time aiocp -b 128k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD160 time aiocp -b 128k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD161 time aiocp -b 128k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD162 time aiocp -b 12k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD163 time aiocp -b 128k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD164 time aiocp -b 128k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD165 time aiocp -b 128k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD166 time aiocp -b 128k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD167 time aiocp -b 128k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD168 time aiocp -b 128k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD169 time aiocp -b 128k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD170 time aiocp -b 128k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD171 time aiocp -b 128k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD172 time aiocp -b 256k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD173 time aiocp -b 256k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD174 time aiocp -b 256k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD175 time aiocp -b 256k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD176 time aiocp -b 256k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD177 time aiocp -b 256k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD178 time aiocp -b 256k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD179 time aiocp -b 256k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD180 time aiocp -b 256k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD181 time aiocp -b 256k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD182 time aiocp -b 256k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD183 time aiocp -b 256k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD184 time aiocp -b 256k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD185 time aiocp -b 256k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD186 time aiocp -b 256k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD187 time aiocp -b 256k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD188 time aiocp -b 256k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD189 time aiocp -b 256k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD190 time aiocp -b 256k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD191 time aiocp -b 256k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD192 time aiocp -b 256k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD193 time aiocp -b 512k -n 1 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD194 time aiocp -b 512k -n 1 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD195 time aiocp -b 512k -n 1 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD196 time aiocp -b 512k -n 2 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD197 time aiocp -b 512k -n 2 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD198 time aiocp -b 512k -n 2 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD199 time aiocp -b 512k -n 4 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD200 time aiocp -b 512k -n 4 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD201 time aiocp -b 512k -n 4 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD202 time aiocp -b 512k -n 8 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD203 time aiocp -b 512k -n 8 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD204 time aiocp -b 512k -n 8 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD205 time aiocp -b 512k -n 16 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD206 time aiocp -b 512k -n 16 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD207 time aiocp -b 512k -n 16 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD208 time aiocp -b 512k -n 32 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD209 time aiocp -b 512k -n 32 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD210 time aiocp -b 512k -n 32 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD211 time aiocp -b 512k -n 64 -f DIRECT $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD212 time aiocp -b 512k -n 64 -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD213 time aiocp -b 512k -n 64 -f DIRECT -f SYNC $TMPDIR/aiodio.$$/junkfile $TMPDIR/aiodio.$$/ff2
-AD301 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPDIR/aiodio.$$/fff $TMPDIR/aiodio.$$/junkdir/fff
-AD302 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPDIR/aiodio.$$/ff1 $TMPDIR/aiodio.$$/junkdir/ff1
-AD303 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPDIR/aiodio.$$/ff2 $TMPDIR/aiodio.$$/junkdir/ff2
-AD304 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPDIR/aiodio.$$/ff3 $TMPDIR/aiodio.$$/junkdir/ff3
+AD001 time aiocp -b 1k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD002 time aiocp -b 1k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD003 time aiocp -b 1k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD004 time aiocp -b 1k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD005 time aiocp -b 1k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD006 time aiocp -b 1k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD007 time aiocp -b 1k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD008 time aiocp -b 1k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD009 time aiocp -b 1k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD010 time aiocp -b 1k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD012 time aiocp -b 1k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD013 time aiocp -b 1k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD014 time aiocp -b 1k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD015 time aiocp -b 1k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD016 time aiocp -b 1k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD017 time aiocp -b 1k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD018 time aiocp -b 1k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD019 time aiocp -b 1k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD020 time aiocp -b 1k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD021 time aiocp -b 1k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD022 time aiocp -b 1k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD023 time aiocp -b 2k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD024 time aiocp -b 2k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD025 time aiocp -b 2k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD026 time aiocp -b 2k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD027 time aiocp -b 2k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD028 time aiocp -b 2k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD029 time aiocp -b 2k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD030 time aiocp -b 2k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD031 time aiocp -b 2k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD032 time aiocp -b 2k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD033 time aiocp -b 2k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD034 time aiocp -b 2k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD035 time aiocp -b 2k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD036 time aiocp -b 2k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD037 time aiocp -b 2k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD038 time aiocp -b 2k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD039 time aiocp -b 2k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD040 time aiocp -b 2k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD041 time aiocp -b 2k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD042 time aiocp -b 2k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD043 time aiocp -b 2k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD044 time aiocp -b 4k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD045 time aiocp -b 4k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD046 time aiocp -b 4k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD047 time aiocp -b 4k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD048 time aiocp -b 4k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD049 time aiocp -b 4k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD050 time aiocp -b 4k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD051 time aiocp -b 4k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD052 time aiocp -b 4k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD053 time aiocp -b 4k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD054 time aiocp -b 4k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD055 time aiocp -b 4k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD056 time aiocp -b 4k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD057 time aiocp -b 4k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD058 time aiocp -b 4k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD059 time aiocp -b 4k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD060 time aiocp -b 4k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD061 time aiocp -b 4k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD062 time aiocp -b 4k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD063 time aiocp -b 4k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD064 time aiocp -b 41k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD065 time aiocp -b 8k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD066 time aiocp -b 8k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD067 time aiocp -b 8k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD068 time aiocp -b 8k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD069 time aiocp -b 8k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD070 time aiocp -b 8k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD071 time aiocp -b 8k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD072 time aiocp -b 8k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD073 time aiocp -b 8k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD074 time aiocp -b 8k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD075 time aiocp -b 8k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD076 time aiocp -b 8k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD077 time aiocp -b 8k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD078 time aiocp -b 8k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD079 time aiocp -b 8k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD080 time aiocp -b 8k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD081 time aiocp -b 8k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD082 time aiocp -b 8k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD083 time aiocp -b 8k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD084 time aiocp -b 8k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD085 time aiocp -b 8k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD086 time aiocp -b 16k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD087 time aiocp -b 16k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD088 time aiocp -b 16k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD089 time aiocp -b 16k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD090 time aiocp -b 16k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD091 time aiocp -b 16k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD092 time aiocp -b 16k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD093 time aiocp -b 16k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD094 time aiocp -b 16k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD095 time aiocp -b 16k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD096 time aiocp -b 16k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD097 time aiocp -b 16k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD098 time aiocp -b 16k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD099 time aiocp -b 16k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD101 time aiocp -b 16k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD102 time aiocp -b 16k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD103 time aiocp -b 16k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD104 time aiocp -b 16k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD105 time aiocp -b 16k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD106 time aiocp -b 16k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD107 time aiocp -b 16k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD108 time aiocp -b 32k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD109 time aiocp -b 32k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD110 time aiocp -b 32k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD112 time aiocp -b 32k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD113 time aiocp -b 32k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD114 time aiocp -b 32k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD115 time aiocp -b 32k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD116 time aiocp -b 32k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD117 time aiocp -b 32k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD118 time aiocp -b 32k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD119 time aiocp -b 32k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD120 time aiocp -b 32k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD121 time aiocp -b 32k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD122 time aiocp -b 32k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD123 time aiocp -b 32k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD124 time aiocp -b 32k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD125 time aiocp -b 32k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD126 time aiocp -b 32k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD127 time aiocp -b 32k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD128 time aiocp -b 32k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD129 time aiocp -b 32k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD130 time aiocp -b 64k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD131 time aiocp -b 64k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD132 time aiocp -b 64k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD133 time aiocp -b 64k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD134 time aiocp -b 64k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD135 time aiocp -b 64k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD136 time aiocp -b 64k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD137 time aiocp -b 64k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD138 time aiocp -b 64k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD139 time aiocp -b 64k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD140 time aiocp -b 64k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD141 time aiocp -b 64k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD142 time aiocp -b 64k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD143 time aiocp -b 64k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD144 time aiocp -b 64k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD145 time aiocp -b 64k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD146 time aiocp -b 64k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD147 time aiocp -b 64k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD148 time aiocp -b 64k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD149 time aiocp -b 64k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD150 time aiocp -b 64k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD151 time aiocp -b 128k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD152 time aiocp -b 128k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD153 time aiocp -b 128k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD154 time aiocp -b 128k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD155 time aiocp -b 128k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD156 time aiocp -b 128k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD157 time aiocp -b 128k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD158 time aiocp -b 128k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD159 time aiocp -b 128k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD160 time aiocp -b 128k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD161 time aiocp -b 128k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD162 time aiocp -b 12k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD163 time aiocp -b 128k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD164 time aiocp -b 128k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD165 time aiocp -b 128k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD166 time aiocp -b 128k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD167 time aiocp -b 128k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD168 time aiocp -b 128k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD169 time aiocp -b 128k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD170 time aiocp -b 128k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD171 time aiocp -b 128k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD172 time aiocp -b 256k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD173 time aiocp -b 256k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD174 time aiocp -b 256k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD175 time aiocp -b 256k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD176 time aiocp -b 256k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD177 time aiocp -b 256k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD178 time aiocp -b 256k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD179 time aiocp -b 256k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD180 time aiocp -b 256k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD181 time aiocp -b 256k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD182 time aiocp -b 256k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD183 time aiocp -b 256k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD184 time aiocp -b 256k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD185 time aiocp -b 256k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD186 time aiocp -b 256k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD187 time aiocp -b 256k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD188 time aiocp -b 256k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD189 time aiocp -b 256k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD190 time aiocp -b 256k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD191 time aiocp -b 256k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD192 time aiocp -b 256k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD193 time aiocp -b 512k -n 1 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD194 time aiocp -b 512k -n 1 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD195 time aiocp -b 512k -n 1 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD196 time aiocp -b 512k -n 2 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD197 time aiocp -b 512k -n 2 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD198 time aiocp -b 512k -n 2 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD199 time aiocp -b 512k -n 4 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD200 time aiocp -b 512k -n 4 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD201 time aiocp -b 512k -n 4 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD202 time aiocp -b 512k -n 8 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD203 time aiocp -b 512k -n 8 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD204 time aiocp -b 512k -n 8 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD205 time aiocp -b 512k -n 16 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD206 time aiocp -b 512k -n 16 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD207 time aiocp -b 512k -n 16 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD208 time aiocp -b 512k -n 32 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD209 time aiocp -b 512k -n 32 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD210 time aiocp -b 512k -n 32 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD211 time aiocp -b 512k -n 64 -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD212 time aiocp -b 512k -n 64 -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD213 time aiocp -b 512k -n 64 -f DIRECT -f SYNC $TMPBASE/aiodio/junkfile.aiocp.src1 $TMPBASE/aiodio/junkfile.aiocp.dst1
+AD301 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src2 $TMPBASE/aiodio/junkdir/junkfile.aiocp.dst2
+AD302 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src3 $TMPBASE/aiodio/junkdir/junkfile.aiocp.dst3
+AD303 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src4 $TMPBASE/aiodio/junkdir/junkfile.aiocp.dst4
+AD304 aiocp -b 128k -n 32 -f CREAT -f DIRECT $TMPBASE/aiodio/junkfile.aiocp.src5 $TMPBASE/aiodio/junkdir/junkfile.aiocp.dst5
diff --git a/runtest/ltp-aiodio.part3 b/runtest/ltp-aiodio.part3
index d53e836b9..74bc27b45 100644
--- a/runtest/ltp-aiodio.part3
+++ b/runtest/ltp-aiodio.part3
@@ -1,51 +1,51 @@
 #           fname:  this filename is Required (no default)
 #
 #
-FSX032 fsx-linux -l 500000 -r 4096 -t 4096 -w 4096 -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX033 fsx-linux -l 500000 -r 4096 -t 2048 -w 2048 -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX034 fsx-linux -l 500000 -r 4096 -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX035 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX036 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX037 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX038 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX039 fsx-linux -N 10000 $TMPDIR/aiodio.$$/junkfile
-FSX040 fsx-linux -N 10000 -o 1024 $TMPDIR/aiodio.$$/junkfile
-FSX041 fsx-linux -N 10000 -o 2048 $TMPDIR/aiodio.$$/junkfile
-FSX042 fsx-linux -N 10000 -o 4096 $TMPDIR/aiodio.$$/junkfile
-FSX043 fsx-linux -N 10000 -o 8192 $TMPDIR/aiodio.$$/junkfile
-FSX044 fsx-linux -N 10000 -o 16384 $TMPDIR/aiodio.$$/junkfile
-FSX045 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
-FSX046 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
-FSX047 fsx-linux -N 10000 -o 1024 $TMPDIR/aiodio.$$/junkfile
-FSX048 fsx-linux -N 10000 -o 2048 $TMPDIR/aiodio.$$/junkfile
-FSX049 fsx-linux -N 10000 -o 4096 $TMPDIR/aiodio.$$/junkfile
-FSX050 fsx-linux -N 10000 -o 8192 $TMPDIR/aiodio.$$/junkfile
-FSX051 fsx-linux -N 10000 -o 16384 $TMPDIR/aiodio.$$/junkfile
-FSX052 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
-FSX053 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
-FSX054 fsx-linux -N 10000  -o 1024 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX055 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX056 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX057 fsx-linux -N 10000  -o 8192 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX058 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX059 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX060 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX061 fsx-linux -N 10000 -o 32768 $TMPDIR/aiodio.$$/junkfile
-FSX062 fsx-linux -N 10000 -o 128000 $TMPDIR/aiodio.$$/junkfile
-FSX063 fsx-linux -N 10000  -o 1024  -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX064 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX065 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX066 fsx-linux -N 10000  -o 8192  -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX067 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX068 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPDIR/aiodio.$$/junkfile
-FSX069 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX070 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile
-FSX071 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPDIR/aiodio.$$/junkfile1
-FSX072 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPDIR/aiodio.$$/junkfile2
-FSX073 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile3
-FSX074 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPDIR/aiodio.$$/junkfile4
-FSX075 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPDIR/aiodio.$$/junkfile5
-FSX076 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPDIR/aiodio.$$/junkfile6
-FSX077 fsx-linux -N 10000   $TMPDIR/aiodio.$$/junkfile7
-FSX078 fsx-linux -N 100000  $TMPDIR/aiodio.$$/junkfile8
-FSX079 fsx-linux -N 100000  $TMPDIR/aiodio.$$/junkfile9
+FSX032 fsx-linux -l 500000 -r 4096 -t 4096 -w 4096 -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX033 fsx-linux -l 500000 -r 4096 -t 2048 -w 2048 -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX034 fsx-linux -l 500000 -r 4096 -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX035 fsx-linux -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX036 fsx-linux -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX037 fsx-linux -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX038 fsx-linux -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX039 fsx-linux -N 10000 $TMPBASE/aiodio/junkfile.fsx1
+FSX040 fsx-linux -N 10000 -o 1024 $TMPBASE/aiodio/junkfile.fsx1
+FSX041 fsx-linux -N 10000 -o 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX042 fsx-linux -N 10000 -o 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX043 fsx-linux -N 10000 -o 8192 $TMPBASE/aiodio/junkfile.fsx1
+FSX044 fsx-linux -N 10000 -o 16384 $TMPBASE/aiodio/junkfile.fsx1
+FSX045 fsx-linux -N 10000 -o 32768 $TMPBASE/aiodio/junkfile.fsx1
+FSX046 fsx-linux -N 10000 -o 128000 $TMPBASE/aiodio/junkfile.fsx1
+FSX047 fsx-linux -N 10000 -o 1024 $TMPBASE/aiodio/junkfile.fsx1
+FSX048 fsx-linux -N 10000 -o 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX049 fsx-linux -N 10000 -o 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX050 fsx-linux -N 10000 -o 8192 $TMPBASE/aiodio/junkfile.fsx1
+FSX051 fsx-linux -N 10000 -o 16384 $TMPBASE/aiodio/junkfile.fsx1
+FSX052 fsx-linux -N 10000 -o 32768 $TMPBASE/aiodio/junkfile.fsx1
+FSX053 fsx-linux -N 10000 -o 128000 $TMPBASE/aiodio/junkfile.fsx1
+FSX054 fsx-linux -N 10000  -o 1024 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX055 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX056 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX057 fsx-linux -N 10000  -o 8192 -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX058 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX059 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX060 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX061 fsx-linux -N 10000 -o 32768 $TMPBASE/aiodio/junkfile.fsx1
+FSX062 fsx-linux -N 10000 -o 128000 $TMPBASE/aiodio/junkfile.fsx1
+FSX063 fsx-linux -N 10000  -o 1024  -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX064 fsx-linux -N 10000  -o 2048 -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX065 fsx-linux -N 10000  -o 4096 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX066 fsx-linux -N 10000  -o 8192  -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX067 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX068 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048 $TMPBASE/aiodio/junkfile.fsx1
+FSX069 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX070 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx1
+FSX071 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPBASE/aiodio/junkfile.fsx2
+FSX072 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPBASE/aiodio/junkfile.fsx3
+FSX073 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx4
+FSX074 fsx-linux -N 10000  -o 16384 -l 500000 -r 4096 -t 4096 -w 4096   $TMPBASE/aiodio/junkfile.fsx5
+FSX075 fsx-linux -N 10000  -o 32768 -l 500000 -r 4096 -t 2048 -w 2048   $TMPBASE/aiodio/junkfile.fsx6
+FSX076 fsx-linux -N 10000  -o 128000 -l 500000 -r 4096 -t 4096 -w 4096 $TMPBASE/aiodio/junkfile.fsx7
+FSX077 fsx-linux -N 10000   $TMPBASE/aiodio/junkfile.fsx7
+FSX078 fsx-linux -N 100000  $TMPBASE/aiodio/junkfile.fsx8
+FSX079 fsx-linux -N 100000  $TMPBASE/aiodio/junkfile.fsx9
diff --git a/runtest/ltp-aiodio.part4 b/runtest/ltp-aiodio.part4
index bb8abfdf1..b303d3a8b 100644
--- a/runtest/ltp-aiodio.part4
+++ b/runtest/ltp-aiodio.part4
@@ -34,16 +34,16 @@ DIO07 dio_sparse
 DIO08 dio_sparse
 DIO09 dio_sparse
 #Running aiodio_append
-AD000 aiodio_append $TMPDIR/aiodio.$$/file2
-AD001 aiodio_append $TMPDIR/aiodio.$$/file2
-AD002 aiodio_append $TMPDIR/aiodio.$$/file2
-AD003 aiodio_append $TMPDIR/aiodio.$$/file2
-AD004 aiodio_append $TMPDIR/aiodio.$$/file2
-AD005 aiodio_append $TMPDIR/aiodio.$$/file2
-AD006 aiodio_append $TMPDIR/aiodio.$$/file2
-AD007 aiodio_append $TMPDIR/aiodio.$$/file2
-AD008 aiodio_append $TMPDIR/aiodio.$$/file2
-AD009 aiodio_append $TMPDIR/aiodio.$$/file2
+AD000 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD001 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD002 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD003 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD004 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD005 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD006 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD007 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD008 aiodio_append $TMPBASE/aiodio/junkfile.append1
+AD009 aiodio_append $TMPBASE/aiodio/junkfile.append1
 #Running dio_append
 ADI000 dio_append
 ADI001 dio_append
@@ -62,7 +62,7 @@ DIT002 dio_truncate
 #Running read_checkzero
 #gread_checkzero
 #Running ltp-diorh
-DOR000 ltp-diorh $TMPDIR/aiodio.$$/file2
-DOR001 ltp-diorh $TMPDIR/aiodio.$$/file3
-DOR002 ltp-diorh $TMPDIR/aiodio.$$/file4
-DOR003 ltp-diorh $TMPDIR/aiodio.$$/file5
+DOR000 ltp-diorh $TMPBASE/aiodio/junkfile.diorh1
+DOR001 ltp-diorh $TMPBASE/aiodio/junkfile.diorh2
+DOR002 ltp-diorh $TMPBASE/aiodio/junkfile.diorh3
+DOR003 ltp-diorh $TMPBASE/aiodio/junkfile.diorh4
diff --git a/testscripts/ltp-aiodio.sh b/testscripts/ltp-aiodio.sh
index 06ea534e3..9928805a7 100755
--- a/testscripts/ltp-aiodio.sh
+++ b/testscripts/ltp-aiodio.sh
@@ -249,11 +249,12 @@ wait $!
 sync
 fi
 
-dd if=$file1 of=$TMP/aiodio/junkfile bs=8192 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/fff      bs=4096 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/ff1      bs=2048 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/ff2      bs=1024 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/ff3      bs=512  conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.src1 bs=8192 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.dst1 bs=4096 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.src2 bs=4096 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.src3 bs=2048 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.src4 bs=1024 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.aiocp.src5 bs=512  conv=block,sync
 
 echo "************ Running aiocp tests "
 sort -R ${LTPROOT}/runtest/ltp-aiodio.part1 -o ${TMPBASE}/ltp-aiodio.part1
@@ -275,26 +276,23 @@ sync
 echo "************ End Running aiodio_sparse tests "
 echo ""
 
-
 if [ "$runExtendedStress" -eq 1 ];then
-echo "************ Running fsx-linux tests "
-sort -R ${LTPROOT}/runtest/ltp-aiodio.part3 -o ${TMPBASE}/ltp-aiodio.part3
-
-${LTPROOT}/bin/ltp-pan -e -S -a ltpaiodiopart3 -n ltp-aiodiopart3 -l ltpaiodio3.logfile -o ltpaiodio3.outfile -p -f ${TMPBASE}/ltp-aiodio.part3 &
+	echo "************ Running fsx-linux tests "
+	sort -R ${LTPROOT}/runtest/ltp-aiodio.part3 -o ${TMPBASE}/ltp-aiodio.part3
 
+	${LTPROOT}/bin/ltp-pan -e -S -a ltpaiodiopart3 -n ltp-aiodiopart3 -l ltpaiodio3.logfile -o ltpaiodio3.outfile -p -f ${TMPBASE}/ltp-aiodio.part3 &
 
-
-wait $!
-sync
+	wait $!
+	sync
+	echo "************ End Running fsx-linux tests "
+	echo ""
 fi
 
-dd if=$file1 of=$TMP/aiodio/file2      bs=2048 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/file3      bs=1024 conv=block,sync
-dd if=$file1 of=$TMP/aiodio/file4      bs=512  conv=block,sync
-dd if=$file1 of=$TMP/aiodio/file5      bs=4096 conv=block,sync
-
-
-
+dd if=$file1 of=$TMP/aiodio/junkfile.append1 bs=8192 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.diorh1  bs=2048 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.diorh2  bs=1024 conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.diorh3  bs=512  conv=block,sync
+dd if=$file1 of=$TMP/aiodio/junkfile.diorh4  bs=4096 conv=block,sync
 
 echo "************ Running dio_sparse & miscellaneous tests "
 sort -R ${LTPROOT}/runtest/ltp-aiodio.part4 -o ${TMPBASE}/ltp-aiodio.part4
@@ -307,10 +305,6 @@ echo ""
 
 echo "************ Cleaning/Umounting"
 
-rm -f $TMP/aiodio/fff
-rm -f $TMP/aiodio/ff1
-rm -f $TMP/aiodio/ff2
-rm -f $TMP/aiodio/ff3
 rm -f $TMP/aiodio/junkfile*
 rm -f $TMP/aiodio/file*
 rm -rf $TMP/aiodio/junkdir
@@ -321,7 +315,6 @@ if [ "$runExtendedStress" -eq 1 ]; then
       umount $part2
 fi
 
-
 done
 date
 echo "AIO/DIO test complete "
-- 
2.31.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
