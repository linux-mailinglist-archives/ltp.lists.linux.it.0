Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id DDB3A3BD44E
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 14:04:53 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id AC31B3C948B
	for <lists+linux-ltp@lfdr.de>; Tue,  6 Jul 2021 14:04:52 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 44C433C1883
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 14:04:48 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 394B7200AE4
 for <ltp@lists.linux.it>; Tue,  6 Jul 2021 14:04:47 +0200 (CEST)
Received: from ubuntu.localdomain (unknown [178.26.168.79])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 510DDA076D;
 Tue,  6 Jul 2021 12:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1625573084; bh=a7LEzT3+3luquJI/p62sK5Kr5bgPnkREjzzO8+hOViE=;
 h=From:To:Subject:Date:Message-Id:MIME-Version;
 b=t0BltprqhHKLtctWr3ybNB9xgE62BW/490ZIehSEQzhSUR/FbWAskRqUTPJ1kv2yr
 eeNDREV2H9GZ03T7IN5VZJpp192/801yCTbOzRrGPbP9PJPYPS3NRQJxftmuyeVQM2
 iJyzxclaP/de8gGNhHH98Z92TC/1b32GNgH+hwiw=
From: Joerg Vehlow <lkml@jv-coder.de>
To: ltp@lists.linux.it,
	pvorel@suse.cz,
	rpalethorpe@suse.de
Date: Tue,  6 Jul 2021 14:04:30 +0200
Message-Id: <20210706120434.867426-1-lkml@jv-coder.de>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: [LTP] [PATCH v2 0/4] fs_bind: Convert to ltp tests
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

Additonal changes to v1:
 - Fixed indentation (should be tabs in all new files now)

Joerg



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
