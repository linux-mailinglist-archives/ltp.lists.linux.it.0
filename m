Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 82AD3456B10
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:19 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CDF493C89E3
	for <lists+linux-ltp@lfdr.de>; Fri, 19 Nov 2021 08:46:18 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 801293C7A4A
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:14 +0100 (CET)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 029CB60043D
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 08:46:13 +0100 (CET)
Received: from ubuntu.localdomain (unknown [188.195.115.12])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 8B4C49F6A0
 for <ltp@lists.linux.it>; Fri, 19 Nov 2021 07:46:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1637307968; bh=Dsy5dA8HC+767TpHni/vDwLjelNslKVZi4BlKXF7l+c=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=e3g9d8JBIyP44SRRQHjvv01gF7C98pzRHUZNRUPh34F566QRxYNkv6FynUdOX5LFE
 Lqvgb3VzbKEmo8wa4PWuKxz/++sw0dY6TkX68mW852GwZCzkOItVbnAk1p//IDcl1i
 muu+3b2QZRLAlVc7Qvb5VKLvFfezd9SdI25T7+X4=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it
Date: Fri, 19 Nov 2021 08:45:50 +0100
Message-Id: <20211119074602.857595-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [Patch 00/12] Fix or suppress compiler warnings in
 posix/conformance/interfaces
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

Hi,

this set of patches removed all compiler warnings (at least fog gcc10),
for all tests in openposix/conformance/interfaces.
I fixed some real issues in separate patches and a lot of similar problems
in bulk patches.
For two categories of warnings I used pragma diagnostic:
 - nonnull: Two nonnull warnings are triggered, where the test is used
   to explicitly test passing NULL. The only way to fix this warning, is
   to supress it.
 - unused-result for write in signal handlers: There is no good way,
   to handle a failing write-call in a signal handler. Most of the time,
   the test is exited anyway, so supressing the warning seems like the best fix.

While these pragmas are gcc specific IIRC they also work for clang.

Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
