Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kNKzL1dBe2n6CwIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 12:15:35 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 61B2BAF83E
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 12:15:35 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id E4F723CBEC2
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 12:15:34 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A7C813C6EEF
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 12:15:31 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 721D5600803
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 12:15:31 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id D757634069;
 Thu, 29 Jan 2026 11:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769685331;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQcjpl6vAm5RR+LkW8MEe241tLLaLZ0uh+zV60JWBlY=;
 b=JqHhv6dAz+T9nN38EBTPgBK20+nrtO7JS2vJVsiE68cX5ElHMPWkjVua9KaChxB+V/Y1Da
 25P6NEMZE8bRPcuLAjvP39drAMWm1emOXN9aSrwtVUaIIgMidCyvOuNt7QCMR/NkUoSl54
 rjEk21c7jJu0v6HBSQrybxn307Vlhro=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769685331;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQcjpl6vAm5RR+LkW8MEe241tLLaLZ0uh+zV60JWBlY=;
 b=GzqXdKQ2fi56q0F5nMY8yopu9oIdUx8PeKkP61WtSHO7CZj8GSDQQb6HOKJk9JKEba8wUw
 Hopt6W2WX0JgrMDg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769685330;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQcjpl6vAm5RR+LkW8MEe241tLLaLZ0uh+zV60JWBlY=;
 b=FOzaVbDb2mXdZUpzQYICBFL0nks2QRgPi3nU4uNgfzdmn1Ee4H2U2ZsY6WaMmhw2i8yM5i
 Ec0MCwzHw5p403DHkZLjyEBdA2QReAuTBd73wW02MPNa3m8HOexsuNOLO+08XxVJ+/xqD+
 fr4+kAXLamOKyZE3zJRnd3JUN53qTTk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769685330;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gQcjpl6vAm5RR+LkW8MEe241tLLaLZ0uh+zV60JWBlY=;
 b=90IuLLy/bXEKznPEVyQVOF4uah8leFl50z63no3r6IXbkUujB+lcANrF2MQkNOiKGxKJgg
 /+BloJzeS61l4xDA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 1E0AD3EA61;
 Thu, 29 Jan 2026 11:15:29 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id uHVgNVFBe2lcFgAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 29 Jan 2026 11:15:29 +0000
Date: Thu, 29 Jan 2026 12:15:23 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20260129111523.GA94367@pevik>
References: <20260122150652.227342-1-kushalkataria5@gmail.com>
 <20260128210346.GA58669@pevik>
 <346f81fd-4ed7-43ea-8dd9-9326c10e0c2b@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <346f81fd-4ed7-43ea-8dd9-9326c10e0c2b@suse.cz>
X-Spam-Score: -3.50
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1] kvm: Add needs_driver support to check for kvm
 driver
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: Kushal Chand K <kushalkataria5@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.99 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a:c];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:replyto,picard.linux.it:helo,picard.linux.it:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_NA(0.00)[suse.cz];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[gmail.com,lists.linux.it];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:-];
	NEURAL_HAM(-0.00)[-0.837];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 61B2BAF83E
X-Rspamd-Action: no action

> On 1/28/26 22:03, Petr Vorel wrote:
> > Hi all,

> > @Martin Is it enough to have kvm driver? Or do tests depend on any of specific
> > kvm kernel config options (not only from virt/kvm/Kconfig, but arch dependent
> > configs e.g.  CONFIG_KVM_GUEST=y from arch/x86/Kconfig ?)

> Some KVM tests can be run by unprivileged user so those also need a check
> whether they have permission to open /dev/kvm for writing. But that can be
> fixed in a separate patch. Let's merge this one with the commit message fix.

+1, thank you!

Merged and I noted this TODO
https://github.com/linux-test-project/ltp/issues/1219#issuecomment-3817000775

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
