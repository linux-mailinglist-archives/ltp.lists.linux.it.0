Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 70AA33BBDD5
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 15:50:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BF7913C8A26
	for <lists+linux-ltp@lfdr.de>; Mon,  5 Jul 2021 15:50:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 5A0FD3C69EE
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 15:50:22 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id EB89460080A
 for <ltp@lists.linux.it>; Mon,  5 Jul 2021 15:50:21 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id A570A9F752;
 Mon,  5 Jul 2021 13:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625493020; bh=D1gX8AhcDA3pb/i6fQtRFVoWrcwzzc5rTKCHivQbZF4=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=jWgfvws6eaT8nJtdtOR//CG6ND5dcIVZG2T0oNRS99f/zZW6xBm7FmPHvJpUpOhAd
 l+cCmEfyGQQKFunu8uyg7DdY2bXQzpV3vYztN6PHDXmGrlYofuujCb2kDSYEIigILb
 cvQtXTTZAoEYgA1xiMjk8vheg9Y4N3kXIhfR5/Kg=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	rpalethorpe@suse.de
Date: Mon,  5 Jul 2021 15:50:13 +0200
Message-Id: <20210705135014.679200-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH 0/1] fs_bind: Convert to ltp tests
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

Hi everyone,

I know this is a huge changeset, but there is not really a good way to         
break it down into multiple commits. Every step in between would either
lead to a broken test suite or a change, that is then changed again.
So I made this one huge commit, that converts all of the tests of the     
testsuite in one go.

I added some minor bugfixes especially added umounts, because some where
missing and some were redundant. I also dropped all useless output (bare ls).

I may have overused EXPECT_PASS a bit here, but I think it does not do any harm,
if all mounts are checked.

Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
