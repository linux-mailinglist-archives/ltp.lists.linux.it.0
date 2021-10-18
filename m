Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 512A243233A
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Oct 2021 17:47:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F384B3C2E5D
	for <lists+linux-ltp@lfdr.de>; Mon, 18 Oct 2021 17:47:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 95A163C2C00
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 17:47:17 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 96E58200B34
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 17:47:16 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 9B0D621961
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 15:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1634572034; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVCBHhRrULB+Sx/oFAgk3nOtMYTSnzApj0jV7AxyJFU=;
 b=dalGTbe3sJdAd0CNjXODnjesLosIrxXA2NP1QIMTB7/fubZ0pEBeAPc8mkJZ9uEEJRs0h4
 OtfWLJKVfnKHRjbrXIxP3fTArQydW5krT+EI4osFtjteXDVGfghchI3rgVXO5P/o334pCv
 lFEYk457A232RybOeMJOdY1U49LjBOQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1634572034;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=lVCBHhRrULB+Sx/oFAgk3nOtMYTSnzApj0jV7AxyJFU=;
 b=gu7J2jDBTLW4IPElhlOWpyuqIWVJs0ZAKplUN8ErpACAEwmv3UW34sdYHLD2nk4+koFUWR
 SrU/l08Ywr8x6+BQ==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 82E87140B7
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 15:47:14 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id 9aOjHgKXbWFpJwAAMHmgww
 (envelope-from <chrubis@suse.cz>)
 for <ltp@lists.linux.it>; Mon, 18 Oct 2021 15:47:14 +0000
From: Cyril Hrubis <chrubis@suse.cz>
To: ltp@lists.linux.it
Date: Mon, 18 Oct 2021 17:47:52 +0200
Message-Id: <20211018154800.11013-1-chrubis@suse.cz>
X-Mailer: git-send-email 2.32.0
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: [LTP] [PATCH 0/7] docparse improvements
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
enables it unconditionally so that the metadata.json file is present on
all builds.

This is first part of bigger effort to get the metadata useful for the
testrunners, expecially we need the .test_variants field to be properly
parsed in order to compute the overall test runtime correctly.

Cyril Hrubis (7):
  docparse: Implement #define and #include
  docparse: Add tests
  docparse: data_storage: Add integer type node
  docparse: Implement ARRAY_SIZE()
  docparse: Add type normalization
  docparse: Group data to 'testsuite' and 'defaults'
  docparse/Makefile: Do not abort on missing generators

 Makefile                             |   5 +-
 docparse/Makefile                    |   4 -
 docparse/data_storage.h              |  45 +++
 docparse/docparse.c                  | 466 ++++++++++++++++++++++++++-
 docparse/parse.sh                    |  18 +-
 docparse/testinfo.pl                 |  16 +-
 docparse/tests/array_size01.c        |   5 +
 docparse/tests/array_size01.c.out    |   4 +
 docparse/tests/array_size02.c        |   5 +
 docparse/tests/array_size02.c.out    |   4 +
 docparse/tests/array_size03.c        |  10 +
 docparse/tests/array_size03.c.out    |   4 +
 docparse/tests/array_size04.c        |   5 +
 docparse/tests/array_size04.c.out    |   4 +
 docparse/tests/empty_struct.c        |   2 +
 docparse/tests/empty_struct.c.out    |   3 +
 docparse/tests/expand_flags.c        |   3 +
 docparse/tests/expand_flags.c.out    |   6 +
 docparse/tests/include.c             |   5 +
 docparse/tests/include.c.out         |   4 +
 docparse/tests/include.h             |   7 +
 docparse/tests/macro.c               |   5 +
 docparse/tests/macro.c.out           |   4 +
 docparse/tests/multiline_macro.c     |   6 +
 docparse/tests/multiline_macro.c.out |   4 +
 docparse/tests/tags.c                |   7 +
 docparse/tests/tags.c.out            |  13 +
 docparse/tests/test.sh               |  18 ++
 m4/ltp-docparse.m4                   |   3 -
 29 files changed, 644 insertions(+), 41 deletions(-)
 create mode 100644 docparse/tests/array_size01.c
 create mode 100644 docparse/tests/array_size01.c.out
 create mode 100644 docparse/tests/array_size02.c
 create mode 100644 docparse/tests/array_size02.c.out
 create mode 100644 docparse/tests/array_size03.c
 create mode 100644 docparse/tests/array_size03.c.out
 create mode 100644 docparse/tests/array_size04.c
 create mode 100644 docparse/tests/array_size04.c.out
 create mode 100644 docparse/tests/empty_struct.c
 create mode 100644 docparse/tests/empty_struct.c.out
 create mode 100644 docparse/tests/expand_flags.c
 create mode 100644 docparse/tests/expand_flags.c.out
 create mode 100644 docparse/tests/include.c
 create mode 100644 docparse/tests/include.c.out
 create mode 100644 docparse/tests/include.h
 create mode 100644 docparse/tests/macro.c
 create mode 100644 docparse/tests/macro.c.out
 create mode 100644 docparse/tests/multiline_macro.c
 create mode 100644 docparse/tests/multiline_macro.c.out
 create mode 100644 docparse/tests/tags.c
 create mode 100644 docparse/tests/tags.c.out
 create mode 100755 docparse/tests/test.sh

-- 
2.32.0


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
