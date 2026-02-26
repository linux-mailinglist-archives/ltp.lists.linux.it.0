Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eJ7zGNs1oGlygwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 13:00:27 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 861EF1A57D2
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 13:00:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772107225; h=to :
 in-reply-to : references : message-id : date : mime-version : subject
 : list-id : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=QTndfAISdcqxzXB6o37sssUK8eOp4gkWfMC9IOEgX7k=;
 b=dc0QTA/v78sDyo2yqLhF/g4rbCdTyTuODAGjWOKh90Ufk1hq2vB1ZB3X3skrNcq52khbe
 LM0rQlBT7vTLPxZObI3lCiaqY3IlfxUMMOL5vTOEy98w337hnq5jjqbu2oFsDU1BaKzR+wW
 UaFfdTshr6ninH0hvx0kcKCoglyNu0A=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1D2703CBD9A
	for <lists+linux-ltp@lfdr.de>; Thu, 26 Feb 2026 13:00:25 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id AA0AE3C7BA1
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 13:00:13 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 21B1E1A0091F
 for <ltp@lists.linux.it>; Thu, 26 Feb 2026 13:00:11 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id C2116402E8;
 Thu, 26 Feb 2026 12:00:10 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 94B993EA62;
 Thu, 26 Feb 2026 12:00:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id HJ80Iso1oGn1eQAAD6G6ig
 (envelope-from <andrea.cervesato@suse.de>); Thu, 26 Feb 2026 12:00:10 +0000
To: ppavlu@suse.cz, ltp@lists.linux.it, Martin Doucha <mdoucha@suse.cz>
In-Reply-To: <20260220154742.54150-1-mdoucha@suse.cz>
References: <20260220154742.54150-1-mdoucha@suse.cz>
Message-Id: <177210721055.697091.9289775077554114667.b4-ty@suse.com>
Date: Thu, 26 Feb 2026 13:00:10 +0100
MIME-Version: 1.0
X-Mailer: b4 0.14.2
X-Spam-Score: -3.90
X-Spam-Level: 
X-Spam-Status: No, score=0.2 required=7.0 tests=HEADER_FROM_DIFFERENT_DOMAINS, 
 SPF_HELO_NONE,
 SPF_PASS shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 0/2] Add test for fanotify monitoring of tracefs
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
From: Andrea Cervesato via ltp <ltp@lists.linux.it>
Reply-To: Andrea Cervesato <andrea.cervesato@suse.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.21 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[lists.linux.it,none];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	HAS_REPLYTO(0.00)[andrea.cervesato@suse.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DKIM_TRACE(0.00)[lists.linux.it:+];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	DBL_BLOCKED_OPENRESOLVER(0.00)[picard.linux.it:helo,picard.linux.it:rdns,linux.it:url,suse.com:mid,suse.com:email,suse.com:replyto,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 861EF1A57D2
X-Rspamd-Action: no action


On Fri, 20 Feb 2026 16:47:07 +0100, Martin Doucha wrote:
> Add test for reading basic fanotify events from a tracefs mount.
> The test will activate monitoring of FAN_MODIFY events from the
> whole mountpoint, create a new kprobe, activate it, deactivate it
> and remove it again. This should generate exactly 4 FAN_MODIFY events.
> 
> On some kernels with badly backported tracefs fixes, this may trigger
> NULL pointer dereference. The testcase is intentionally simple but
> sufficient to trigger this kind of bug. More complex tracing subtests
> can be added later.
> 
> [...]

Applied, thanks!

[1/2] tst_fs.h: Add TST_TRACEFS_MAGIC constant
      commit: a510fbdd2e85eb0d736a1fe498e03340d4af21fe
[2/2] Add test for fanotify monitoring of tracing filesystem
      commit: 6d941650ab4b629b3c27423edbda08597106db5f

Best regards,
-- 
Andrea Cervesato <andrea.cervesato@suse.com>


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
