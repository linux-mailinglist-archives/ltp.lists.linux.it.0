Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 648028D4F16
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2024 17:28:57 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D9E8A3D072D
	for <lists+linux-ltp@lfdr.de>; Thu, 30 May 2024 17:28:56 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 20CA43C1037
 for <ltp@lists.linux.it>; Thu, 30 May 2024 17:28:54 +0200 (CEST)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:1; helo=smtp-out1.suse.de;
 envelope-from=akumar@suse.de; receiver=lists.linux.it)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 75BED206C38
 for <ltp@lists.linux.it>; Thu, 30 May 2024 17:28:54 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 8E032338A3;
 Thu, 30 May 2024 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717082931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zIknPPew+UTNeiJUROCxmakzOPUCQdCCVcJK7pekwE=;
 b=QkQLKlvctPwWnORFgAh+kt5JXiyJJassTdXLWV7/45fpvA1n8zeec+1Bwt9BXIjnxNtaPA
 Kx2elyw+SmuUVQInOuzGLXEMrXQTG8GWWz2NjZVVC8R7KbVzltQDxUNebUCanqeocJc3I+
 yq/A2aWqhp0Scg0Pd/9a2B38K3Js3Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717082931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zIknPPew+UTNeiJUROCxmakzOPUCQdCCVcJK7pekwE=;
 b=cl5PBqH1Fh7aC3wgDg74xDn2kolyKCjdJdUJGBZtk5hEec5kKKmoddWQe+BhLa1hsQo0NV
 1esX0/egsPgbvkCA==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=QkQLKlvc;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=cl5PBqH1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1717082931; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zIknPPew+UTNeiJUROCxmakzOPUCQdCCVcJK7pekwE=;
 b=QkQLKlvctPwWnORFgAh+kt5JXiyJJassTdXLWV7/45fpvA1n8zeec+1Bwt9BXIjnxNtaPA
 Kx2elyw+SmuUVQInOuzGLXEMrXQTG8GWWz2NjZVVC8R7KbVzltQDxUNebUCanqeocJc3I+
 yq/A2aWqhp0Scg0Pd/9a2B38K3Js3Ls=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1717082931;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=+zIknPPew+UTNeiJUROCxmakzOPUCQdCCVcJK7pekwE=;
 b=cl5PBqH1Fh7aC3wgDg74xDn2kolyKCjdJdUJGBZtk5hEec5kKKmoddWQe+BhLa1hsQo0NV
 1esX0/egsPgbvkCA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 7F9A213A42;
 Thu, 30 May 2024 15:28:51 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Lj5jHjObWGbCeQAAD6G6ig
 (envelope-from <akumar@suse.de>); Thu, 30 May 2024 15:28:51 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Petr Vorel <pvorel@suse.cz>
Date: Thu, 30 May 2024 17:28:51 +0200
Message-ID: <5635247.IbC2pHGDlb@localhost>
Organization: SUSE
In-Reply-To: <20240527063346.289771-16-pvorel@suse.cz>
References: <20240527063346.289771-1-pvorel@suse.cz>
 <20240527063346.289771-16-pvorel@suse.cz>
MIME-Version: 1.0
X-Spam-Level: 
X-Spamd-Result: default: False [-5.00 / 50.00]; BAYES_HAM(-2.49)[97.68%];
 DWL_DNSWL_MED(-2.00)[suse.de:dkim];
 NEURAL_HAM_LONG(-1.00)[-1.000]; CTE_CASE(0.50)[];
 MID_RHS_NOT_FQDN(0.50)[]; NEURAL_HAM_SHORT(-0.20)[-1.000];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 MIME_GOOD(-0.10)[text/plain]; MX_GOOD(-0.01)[];
 RCPT_COUNT_TWO(0.00)[2];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 HAS_ORG_HEADER(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]; 
 MIME_TRACE(0.00)[0:+];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 ARC_NA(0.00)[]; FROM_EQ_ENVFROM(0.00)[];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TO_DN_SOME(0.00)[];
 RECEIVED_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:106:10:150:64:167:received];
 RCVD_COUNT_TWO(0.00)[2]; FROM_HAS_DN(0.00)[];
 RCVD_VIA_SMTP_AUTH(0.00)[]; DKIM_TRACE(0.00)[suse.de:+];
 MISSING_XM_UA(0.00)[]; RCVD_TLS_ALL(0.00)[];
 DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,
 imap1.dmz-prg2.suse.org:rdns, suse.de:dkim, suse.de:email]
X-Rspamd-Action: no action
X-Rspamd-Queue-Id: 8E032338A3
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spam-Score: -5.00
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 15/15] cgroup_xattr: Remove kernel >= 3.15 check
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi,

Reviewed-by: Avinesh Kumar <akumar@suse.de>
for all patches in this series.


Thank you,
Avinesh



-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
