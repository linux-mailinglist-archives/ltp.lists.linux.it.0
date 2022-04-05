Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 58FD94F3527
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Apr 2022 15:48:48 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0A47A3CA44F
	for <lists+linux-ltp@lfdr.de>; Tue,  5 Apr 2022 15:48:48 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id C457A3CA419
 for <ltp@lists.linux.it>; Tue,  5 Apr 2022 15:48:45 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 97980100079A
 for <ltp@lists.linux.it>; Tue,  5 Apr 2022 15:48:44 +0200 (CEST)
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id C05241F390;
 Tue,  5 Apr 2022 13:48:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1649166523; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zKjKpzyt84tBRoCUTSX+H3b3ZAANltV5kuUJALDdFGY=;
 b=ggfH/Fps71mCHpeporNftEYHYqtKOgEMz1Cyw5mkgTui1yN9NsG/rGFfa0wErgjpvYhfI2
 +gYeCL8kX9b8PnbiZjC3i1bhg46/IIs2IH6aCQAJ+vlpRsonW2B8ZCGM44TgjVJ4XlwsdC
 Q4B/vqdLe5KnthU/E9nY9hkGtU6HwNM=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1649166523;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version: content-transfer-encoding:content-transfer-encoding;
 bh=zKjKpzyt84tBRoCUTSX+H3b3ZAANltV5kuUJALDdFGY=;
 b=V2ovM+c0hHCoUDwRsrJXoXfK14gcHdz7MWaIQhOefCVbhxV4pp/4FejDhiI8JHl+8KcYAA
 kgedAgL1oAWfTzBA==
Received: from imap2.suse-dmz.suse.de (imap2.suse-dmz.suse.de [192.168.254.74])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-521) server-digest SHA512)
 (No client certificate requested)
 by imap2.suse-dmz.suse.de (Postfix) with ESMTPS id 2426A13522;
 Tue,  5 Apr 2022 13:48:43 +0000 (UTC)
Received: from dovecot-director2.suse.de ([192.168.254.65])
 by imap2.suse-dmz.suse.de with ESMTPSA id w+4nBLtITGIUOwAAMHmgww
 (envelope-from <pvorel@suse.cz>); Tue, 05 Apr 2022 13:48:43 +0000
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Date: Tue,  5 Apr 2022 15:48:35 +0200
Message-Id: <20220405134838.9440-1-pvorel@suse.cz>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-4.smtp.seeweb.it
Subject: [LTP] [PATCH 0/3] confstr01: rewrite and fix musl
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

I finished and extended Andrea's effort from
https://patchwork.ozlabs.org/project/ltp/patch/20220216111013.32056-1-andrea.cervesato@suse.de/

Kind regards,
Petr

Andrea Cervesato (1):
  confstr01.c: Rewrite into new API

Petr Vorel (2):
  confstr01: Update to X/Open 7 (POSIX 2008)
  ci/alpine.sh: Build confstr01.c

 ci/alpine.sh                                  |   3 +-
 testcases/kernel/syscalls/confstr/confstr01.c | 160 ++++++------------
 2 files changed, 53 insertions(+), 110 deletions(-)

-- 
2.35.1


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
