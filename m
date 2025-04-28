Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 47389A9F0AD
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Apr 2025 14:29:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 0BB913CBB24
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Apr 2025 14:29:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id EDA9C3CB6CF
 for <ltp@lists.linux.it>; Mon, 28 Apr 2025 14:29:30 +0200 (CEST)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 505491000A2C
 for <ltp@lists.linux.it>; Mon, 28 Apr 2025 14:29:29 +0200 (CEST)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id 166B821210;
 Mon, 28 Apr 2025 12:29:28 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DD5821336F;
 Mon, 28 Apr 2025 12:29:27 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id lq2UM6d0D2gwUAAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Mon, 28 Apr 2025 12:29:27 +0000
Date: Mon, 28 Apr 2025 14:29:25 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Martin Doucha <mdoucha@suse.cz>
Message-ID: <20250428122925.GA98442@pevik>
References: <20250407142351.25900-1-mdoucha@suse.cz>
 <20250407142351.25900-4-mdoucha@suse.cz>
 <20250416062255.GB560513@pevik> <20250416071621.GA572828@pevik>
 <f15a8e70-b520-43be-bf65-202848c6d176@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <f15a8e70-b520-43be-bf65-202848c6d176@suse.cz>
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Spam-Level: 
X-Spamd-Result: default: False [-4.00 / 50.00]; REPLY(-4.00)[];
 ASN(0.00)[asn:25478, ipnet:::/0, country:RU]
X-Spam-Score: -4.00
X-Rspamd-Queue-Id: 166B821210
X-Rspamd-Pre-Result: action=no action; module=replies;
 Message is reply to one we originated
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 3/5] KVM: Simplify reading VMX control field masks
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Martin,

> Hi!

> On 16. 04. 25 9:16, Petr Vorel wrote:
> > Hi Martin,

> > > Hi Martin,

> > > ...
> > > >   	/* Configure VM execution control fields */
> > > > -	if (kvm_rdmsr(MSR_IA32_VMX_BASIC) & IA32_VMXBASIC_USELESS_CTL_MASKS) {
> > > > -		pinxctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_PINX_MASK2);
> > > > -		execctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_EXECCTL_MASK2);
> > > > -		exitctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_EXITCTL_MASK2);
> > > > -		entryctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_ENTRYCTL_MASK2);
> > > > -	} else {
> > > > -		pinxctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_PINX_MASK);
> > > > -		execctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_EXECCTL_MASK);
> > > > -		exitctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_EXITCTL_MASK);
> > > > -		entryctl = (uint32_t)kvm_rdmsr(MSR_IA32_VMX_ENTRYCTL_MASK);

> > The rest of the patchset merged, thank you!

> > > I guess you're going to use in the future MSR_IA32_VMX_PINX_MASK2 and other
> > > deleted masks (because now they are IMHO only in the structs).

> > If you don't need the constants in the future, please remove it in a subsequent
> > patch.

> Those constants are still used in kvm_vmx_read_vmctl_mask() via the static
> lookup table in lib_x86.c. We can't remove them because the tests would
> break on old CPUs.

Good to know, thanks for info!

Kind regards,
Petr

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
