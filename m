Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id C26DB3BF555
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 07:58:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 359283C4DB0
	for <lists+linux-ltp@lfdr.de>; Thu,  8 Jul 2021 07:58:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id D0D023C4DB0
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 07:58:06 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D30B21A00816
 for <ltp@lists.linux.it>; Thu,  8 Jul 2021 07:58:05 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 751919FBF9;
 Thu,  8 Jul 2021 05:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625723883; bh=Ayif26DTjy4nsReytRWcYqGZgtMXh43/c3z4ffDXtqM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=bGV4Y/GZ8WcO7mgQFNBAKq245m7xJ4taOsEVVllkAYZYzuASvawIz80B2/yIrR29l
 KIPeKuhwGRHSkm2/rJj1NyQnFX8SMPVtygpFMApKRPaSr+BeJjW0mcYrCqizjBxlBf
 Vg2CJUoi0KLBdHIVn5nzMjfDvaVDv/+CansSRaZ8=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	rpalethorpe@suse.de
Date: Thu,  8 Jul 2021 07:57:53 +0200
Message-Id: <20210708055757.945702-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v3 0/4] fs_bind: Convert to ltp tests
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

I split up the patch into 4 commits. The first one just renames
all tests to the new nameing schema, in order to make git detect
renames instead of delete/add.

Additonal in v2:
 - Fixed indentation (should be tabs in all new files now)
Changes in v3:
 - Fix portability issue in getopts usage

Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
