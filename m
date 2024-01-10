Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B7DC829662
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jan 2024 10:41:09 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 39B4A3CE48D
	for <lists+linux-ltp@lfdr.de>; Wed, 10 Jan 2024 10:41:09 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id BF4873C08CF
 for <ltp@lists.linux.it>; Wed, 10 Jan 2024 10:41:07 +0100 (CET)
Authentication-Results: in-7.smtp.seeweb.it;
 spf=pass (sender SPF authorized) smtp.mailfrom=suse.de
 (client-ip=2a07:de40:b251:101:10:150:64:2; helo=smtp-out2.suse.de;
 envelope-from=akumar@suse.de; receiver=lists.linux.it)
Received: from smtp-out2.suse.de (smtp-out2.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 6F0782202E1
 for <ltp@lists.linux.it>; Wed, 10 Jan 2024 10:41:06 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id E41F21F8A8;
 Wed, 10 Jan 2024 09:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704879665; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5FkPPaddV8IsyK7xptXD0llrZbvgJJ5MEPuR9JbJIA=;
 b=YVkDHPj5o37+VivrB3/Y4n1LBLYlg5ivlKa+MrqtGZBuXwROWXE8O1lI1aVBWSagxOmIu6
 WWX05MIosNxmffzICijBZxVBw8Uym1JilRMWvaoRXx67WW1IGa3SvkmMECHXvUhoa8CZ/9
 ILVefyTL+0EdkJT5GmO4Vlhrbo1bpw0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704879665;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5FkPPaddV8IsyK7xptXD0llrZbvgJJ5MEPuR9JbJIA=;
 b=VVCiDuUzaVS16Lz5dKDISIHebCAf8VnOeJlBcpUmqlQztGl9psan2GCnRj/s8ImGEtuEQv
 XE0hkpmkHBnPvSAA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1704879664; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5FkPPaddV8IsyK7xptXD0llrZbvgJJ5MEPuR9JbJIA=;
 b=XXHS9MJgV8d/s0wFjGKzTvnqXBQptNQ/g233L9qRbzMkEC3BtJ+eALuHDchco3qLtoMtk8
 slMHF3uqxCpHcl25qK1gu/xrqO/ZqnR8f8xUivTASPpDiZdxRRF+gQiCqGFN8++xSSgT9T
 ORu7QNtOt5qO6fuZFbFM69zwoX+VgYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1704879664;
 h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
 mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=L5FkPPaddV8IsyK7xptXD0llrZbvgJJ5MEPuR9JbJIA=;
 b=BSYH9Wqu7CrZE71vNa3hWxVhBrc6DEmkhruT9pdPYc77BJ1V7ZEGyyUvRAVJCRGbn+/fP9
 uCDS/Zqp90ttLTCQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id D557B13CB3;
 Wed, 10 Jan 2024 09:41:04 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id Z1BJMzBmnmUhJgAAD6G6ig
 (envelope-from <akumar@suse.de>); Wed, 10 Jan 2024 09:41:04 +0000
From: Avinesh Kumar <akumar@suse.de>
To: Petr Vorel <petr.vorel@gmail.com>
Date: Wed, 10 Jan 2024 10:41:04 +0100
Message-ID: <1832890.05rotGpD9z@localhost>
Organization: SUSE
In-Reply-To: <20240109171502.GA1661159@pevik>
References: <ZUEd79N7aiC_VCDO@yuki> <20231211204908.7212-1-akumar@suse.de>
 <20240109171502.GA1661159@pevik>
MIME-Version: 1.0
X-Spam-Level: 
X-Spam-Level: 
X-Spam-Score: -0.75
X-Rspamd-Queue-Id: E41F21F8A8
Authentication-Results: smtp-out2.suse.de;
 dkim=pass header.d=suse.de header.s=susede2_rsa header.b=XXHS9MJg;
 dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=BSYH9Wqu
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Bar: /
X-Spamd-Result: default: False [-0.75 / 50.00]; RCVD_VIA_SMTP_AUTH(0.00)[];
 SPAMHAUS_XBL(0.00)[2a07:de40:b281:104:10:150:64:97:from];
 TO_DN_SOME(0.00)[]; HAS_ORG_HEADER(0.00)[];
 RCVD_COUNT_THREE(0.00)[3]; DKIM_TRACE(0.00)[suse.de:+];
 RCPT_COUNT_TWO(0.00)[2]; MX_GOOD(-0.01)[];
 FREEMAIL_TO(0.00)[gmail.com]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; CTE_CASE(0.50)[];
 BAYES_HAM(-0.24)[73.09%]; ARC_NA(0.00)[];
 R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 FROM_HAS_DN(0.00)[]; FREEMAIL_ENVRCPT(0.00)[gmail.com];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; TAGGED_RCPT(0.00)[];
 MIME_GOOD(-0.10)[text/plain]; NEURAL_HAM_LONG(-1.00)[-1.000];
 NEURAL_HAM_SHORT(-0.20)[-1.000];
 DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
 DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
 FUZZY_BLOCKED(0.00)[rspamd.com]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_TLS_ALL(0.00)[];
 RBL_SPAMHAUS_BLOCKED_OPENRESOLVER(0.00)[2a07:de40:b281:104:10:150:64:97:from]
X-Virus-Scanned: clamav-milter 1.0.3 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3] syscalls/mmap15: Rewrite test using new LTP API
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

On Tuesday, January 9, 2024 6:15:02 PM CET Petr Vorel wrote:
> Hi Avinesh,
> 
> I'm sorry v3 come too late, although Cyril pointed out not needed needs_root
> and else if => if change, in the end v2 was merged.
> 
> Thus I fixed this as a separate change.
> 
> Kind regards,
> Petr

Hi Petr,

Thank you! I didn't see a reply with merged. Maybe I should have checked the 
version on master branch before sending the revision.

--
Avinesh




-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
