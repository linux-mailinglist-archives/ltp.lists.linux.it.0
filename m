Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DCA4581F86
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 07:34:11 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3DF053C1C3B
	for <lists+linux-ltp@lfdr.de>; Wed, 27 Jul 2022 07:34:11 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 19DA93C03F6
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 07:34:09 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 3336B2009E9
 for <ltp@lists.linux.it>; Wed, 27 Jul 2022 07:34:08 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [91.26.40.236])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 0EF7C9F650;
 Wed, 27 Jul 2022 05:34:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1658900048; bh=/pPiETDgxK+iDJanMZ7QFcjrpHS0ivwCazgVQiVSXlM=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=MVigwpe2WnnKD8ptaqOVR74TYnJLL5Jq+GXp+0yhpo9gPuoyHRWkax86TuOQaDstS
 Bb0ZynKYXIaJ88wWUeOmm1s2maArgxVHyNSU1vmu13h6Xihz6M9cjxqVJRIIAIrgfJ
 WWTiDI7l0ZIdR85ABUFkCEjFJ1SYKeIVLhTibVBE=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	chrubis@suse.cz,
	rpalethorpe@suse.de
Date: Wed, 27 Jul 2022 07:33:04 +0200
Message-Id: <20220727053307.3009235-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 0/3] openposix: Fix installation file layout
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

Update to v1:
 - Replaced deprecated AC_PROG_CC_C99
 - Fixed whitespace
 - Fixed help message for configure script of ltp
 - Added a more verbose commit message to the last commit


Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
