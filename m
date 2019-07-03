Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6F62D5E200
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:24:16 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 269753C1DB6
	for <lists+linux-ltp@lfdr.de>; Wed,  3 Jul 2019 12:24:16 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 11B763C1D4C
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:24:12 +0200 (CEST)
Received: from youngberry.canonical.com (youngberry.canonical.com
 [91.189.89.112])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id AB7051A014AD
 for <ltp@lists.linux.it>; Wed,  3 Jul 2019 12:24:11 +0200 (CEST)
Received: from mail-pg1-f199.google.com ([209.85.215.199])
 by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
 (Exim 4.76) (envelope-from <po-hsu.lin@canonical.com>)
 id 1hicPw-0004SP-0L
 for ltp@lists.linux.it; Wed, 03 Jul 2019 10:23:12 +0000
Received: by mail-pg1-f199.google.com with SMTP id f18so1357928pgb.10
 for <ltp@lists.linux.it>; Wed, 03 Jul 2019 03:23:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:subject:date:message-id;
 bh=cY0g+HzCdq2B8qVGQ9eDJ0qUqd157mDx7Ic0UfNV450=;
 b=MGxRNraSe/c+6zhI2nFh/H7MDjT9X0gJ+YWFw5DGXbRdl9MJJZ61SkWJ6tutdnFN4r
 JBnUbenmiLhJZdwDr5KLlYEtnhWmhNgF88S9NJDdymDMRmpxtt+dENF/u6eHJ/NgNFTq
 0PZajwd0yjWVOoptGT5LWyxFTtHWjy0wzBj6UIZyinXQ5Jp2uhaJJ+Z9seiyFbCCwRDs
 XK5djqHyT+vjd314yWlLXHfcCttkFW8eTsFp66IZVmyou+lXc1qAG1kes2Z+vz7EoqPa
 x+4BGbgxcep6UJVkYBaZjxSsLTSf53cIgpPm8n08gY68fdaKrZdq6xYAhCB8eB6oo8gF
 qvuw==
X-Gm-Message-State: APjAAAU9jxvBiRYfGA2tA9yIaHBYFNPgf58Oo1SuaWHcjr0USkF6YiAa
 h/1/TrwJjii+zocm+Jj8xTYol3jMGlRCzmotMduTG65c9IqY3SZj1CsoetlGSgGle6AkxKh1dSu
 YjCRelO+1vE/CQKdmx3pIDdjAuro=
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr40929579plb.292.1562149390504; 
 Wed, 03 Jul 2019 03:23:10 -0700 (PDT)
X-Google-Smtp-Source: APXvYqxIvQmJG1eZmi13phKc6JtsBdK2qF1go2XRJRLwM39QoCLbb+yoOE29vveh1YdqkKanOyz5wA==
X-Received: by 2002:a17:902:f301:: with SMTP id
 gb1mr40929539plb.292.1562149390067; 
 Wed, 03 Jul 2019 03:23:10 -0700 (PDT)
Received: from Leggiero.taipei.internal (61-220-137-37.HINET-IP.hinet.net.
 [61.220.137.37])
 by smtp.gmail.com with ESMTPSA id f19sm3257642pfk.180.2019.07.03.03.23.08
 for <ltp@lists.linux.it>
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Wed, 03 Jul 2019 03:23:09 -0700 (PDT)
From: Po-Hsu Lin <po-hsu.lin@canonical.com>
To: ltp@lists.linux.it
Date: Wed,  3 Jul 2019 18:23:00 +0800
Message-Id: <20190703102303.32166-1-po-hsu.lin@canonical.com>
X-Mailer: git-send-email 2.17.1
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_NONE
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] zram/zram_lib.sh: fix zram_compress_alg() test
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
  1. One-liner local variable assignment with space-separated value does
     not work for DASH, which is symbolically linked to /bin/sh on some
     OS like Ubuntu.
  2. Inconsistent variable name for compression algorithms, and the
     algorithm name needs to be sanitized.
  3. Hard-coded block device numbers to iterate with. If the number of
     the available zram compression algorithms is larger than the
     number of block devices, the test will fail.

Po-Hsu Lin (3):
  zram/zram_lib.sh: fix local variable assignment for DASH
  zram/zram_lib.sh: fix variable name and algorithm retrieval
  zram/zram_lib.sh: iterate through all available compression algorithms
    for all zram block devices

 .../kernel/device-drivers/zram/zram_lib.sh    | 22 ++++++++++++-------
 1 file changed, 14 insertions(+), 8 deletions(-)

-- 
2.17.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
