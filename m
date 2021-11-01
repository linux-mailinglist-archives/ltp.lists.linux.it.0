Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 844EF441CDE
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 15:53:06 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 684AC3C7100
	for <lists+linux-ltp@lfdr.de>; Mon,  1 Nov 2021 15:53:05 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 088543C7046
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 15:52:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id E50361A004AD
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 15:52:48 +0100 (CET)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id E1138212CA
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 14:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1635778367; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gg8ixNTFyzzLYuhP9Ec9ucpV1vgMpPWn3iSjOz5W1tU=;
 b=K7LiIQAqywVOidwuFhXsBZpjns0KaTPXcELAcggt+EbRt8RSg/IsqgZWlW4oRoizYfV5ep
 Rs4KjgSiV+QFuT8xy4AXouj368A4i3EhczbwAqcOcbDn5+oXd6CKLnefGOEwHbKVFOoFNx
 B6g4TMW4uexn/G9riQ6sfVeYuo64i+E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1635778367;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=Gg8ixNTFyzzLYuhP9Ec9ucpV1vgMpPWn3iSjOz5W1tU=;
 b=YS4z8FMBIIFCl/BHKnv40tLzp8ETVUVPO1EP2wlXw2nqY89XDPfyaAHjataeLHy+gmCWRw
 khpGxrw0SZlw/8Bg==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id CD65813522
 for <ltp@lists.linux.it>; Mon,  1 Nov 2021 14:52:47 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id mnD+MT//f2GvLQAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 01 Nov 2021 14:52:47 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon,  1 Nov 2021 15:53:35 +0100
Message-Id: <20211101145342.7166-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: [LTP] [PATCH v2 0/7] docparse improvements
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

Implement support for various missing bits to the docparse tool and
enables it unconditionally so that the metadata file is present on
all builds.

This is first part of bigger effort to get the metadata useful for the
testrunners, expecially we need the .test_variants field to be properly
parsed in order to compute the overall test runtime correctly.

v2:
     - Cleaned up the patchset a bit

    pvorel:
     - Added Makefile to metadata tests
     - Rename the expected output files to foo.c.json

    rpalethorpe:
     - Fixed parsing of the '# include' and '# define' directives
       now the hash character produces a separate token and any
       whitespaces between it and the keyword are removed by the
       parser

Cyril Hrubis (7):
  docparse: Implement #define and #include
  docparse: Add tests
  docparse: data_storage: Add integer type node
  docparse: Implement ARRAY_SIZE()
  docparse: Add type normalization
  docparse: Group data to 'testsuite' and 'defaults'
  docparse: Split into metadata and docparse

 Makefile                              |   5 +-
 docparse/.gitignore                   |   2 -
 docparse/Makefile                     |  12 +-
 docparse/docparse.c                   | 434 -------------
 docparse/testinfo.pl                  |  16 +-
 metadata/.gitignore                   |   2 +
 metadata/Makefile                     |  26 +
 {docparse => metadata}/data_storage.h |  45 ++
 metadata/metaparse.c                  | 892 ++++++++++++++++++++++++++
 {docparse => metadata}/parse.sh       |  18 +-
 metadata/tests/Makefile               |   4 +
 metadata/tests/array_size01.c         |   5 +
 metadata/tests/array_size01.c.json    |   4 +
 metadata/tests/array_size02.c         |   9 +
 metadata/tests/array_size02.c.json    |   4 +
 metadata/tests/array_size03.c         |  10 +
 metadata/tests/array_size03.c.json    |   4 +
 metadata/tests/array_size04.c         |   5 +
 metadata/tests/array_size04.c.json    |   4 +
 metadata/tests/empty_struct.c         |   2 +
 metadata/tests/empty_struct.c.json    |   3 +
 metadata/tests/expand_flags.c         |   3 +
 metadata/tests/expand_flags.c.json    |   6 +
 metadata/tests/include.c              |   5 +
 metadata/tests/include.c.json         |   4 +
 metadata/tests/include.h              |   7 +
 metadata/tests/macro.c                |   5 +
 metadata/tests/macro.c.json           |   4 +
 metadata/tests/multiline_macro.c      |   6 +
 metadata/tests/multiline_macro.c.json |   4 +
 metadata/tests/tags.c                 |   7 +
 metadata/tests/tags.c.json            |  13 +
 metadata/tests/test.sh                |  18 +
 33 files changed, 1123 insertions(+), 465 deletions(-)
 delete mode 100644 docparse/docparse.c
 create mode 100644 metadata/.gitignore
 create mode 100644 metadata/Makefile
 rename {docparse => metadata}/data_storage.h (89%)
 create mode 100644 metadata/metaparse.c
 rename {docparse => metadata}/parse.sh (58%)
 create mode 100644 metadata/tests/Makefile
 create mode 100644 metadata/tests/array_size01.c
 create mode 100644 metadata/tests/array_size01.c.json
 create mode 100644 metadata/tests/array_size02.c
 create mode 100644 metadata/tests/array_size02.c.json
 create mode 100644 metadata/tests/array_size03.c
 create mode 100644 metadata/tests/array_size03.c.json
 create mode 100644 metadata/tests/array_size04.c
 create mode 100644 metadata/tests/array_size04.c.json
 create mode 100644 metadata/tests/empty_struct.c
 create mode 100644 metadata/tests/empty_struct.c.json
 create mode 100644 metadata/tests/expand_flags.c
 create mode 100644 metadata/tests/expand_flags.c.json
 create mode 100644 metadata/tests/include.c
 create mode 100644 metadata/tests/include.c.json
 create mode 100644 metadata/tests/include.h
 create mode 100644 metadata/tests/macro.c
 create mode 100644 metadata/tests/macro.c.json
 create mode 100644 metadata/tests/multiline_macro.c
 create mode 100644 metadata/tests/multiline_macro.c.json
 create mode 100644 metadata/tests/tags.c
 create mode 100644 metadata/tests/tags.c.json
 create mode 100755 metadata/tests/test.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
