Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 547EB395439
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 05:37:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id C35143C9118
	for <lists+linux-ltp@lfdr.de>; Mon, 31 May 2021 05:37:45 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1527A3C0F60
 for <ltp@lists.linux.it>; Mon, 31 May 2021 05:37:41 +0200 (CEST)
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.220.29])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 58F37600706
 for <ltp@lists.linux.it>; Mon, 31 May 2021 05:37:40 +0200 (CEST)
Received: from imap.suse.de (imap-alt.suse-dmz.suse.de [192.168.254.47])
 (using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by smtp-out2.suse.de (Postfix) with ESMTPS id 5A2191FD2E;
 Mon, 31 May 2021 03:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622432260;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbfBeqFdNHQ0Gfwv8Xz+DIAaM7jbr6UPvOyY8QjYVP8=;
 b=FEgb2NkcE2M2WmriuysbnyDJfaLIzejK0StXU/H3sXYNEeZ+GOQDx01HDIgYoLCm28OujV
 x4VNzAlG3Z1YO7RMikmiQ0Mat/SYPbpp+fK0DSG0M+fSeEwcnqklFs/oD+JPVKCQdLReIm
 sQ1Af+UYBxrDc50GHenbH65fHsyPm2E=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622432260;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbfBeqFdNHQ0Gfwv8Xz+DIAaM7jbr6UPvOyY8QjYVP8=;
 b=vqTRXqkgAE/ko3CR17+GkLUQ1y9e9RddHKWQ36O8XWZcCwnmeEmO1rSZ+pRIRTdY3bvKGw
 ObmFMxl/4MRkUPCA==
Received: from imap3-int (imap-alt.suse-dmz.suse.de [192.168.254.47])
 by imap.suse.de (Postfix) with ESMTP id 00DE5118DD;
 Mon, 31 May 2021 03:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1622432259;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbfBeqFdNHQ0Gfwv8Xz+DIAaM7jbr6UPvOyY8QjYVP8=;
 b=kwuEu9MbUj0CruQN/+G/1nqyC5LbteJxgq84LxPfzSEhJxvkLcNEYAdcSFvbIok0h02pF3
 fH0BXlyEuSTvJLF9FceR/CAlXX7QAIRc+mEcmOcGx0J4ytcHiwxOyGGtT5uQ+Qt43zggk5
 x6Iifb8GE0nITSIMnBaW8M30L2/fVKI=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1622432259;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=KbfBeqFdNHQ0Gfwv8Xz+DIAaM7jbr6UPvOyY8QjYVP8=;
 b=cx1CLCHTTZBY1RCUOMvW+XFEO4RsSCyrtQXDTsZ8TImkfk2OWNNTzxFUaS95Z5UElM8qaY
 JJTpbSAjnEFuFNCg==
Received: from director2.suse.de ([192.168.254.72]) by imap3-int with ESMTPSA
 id 35UDOgJatGB0RAAALh3uQQ
 (envelope-from <pvorel@suse.cz>); Mon, 31 May 2021 03:37:38 +0000
Date: Mon, 31 May 2021 05:37:37 +0200
From: Petr Vorel <pvorel@suse.cz>
To: ltp@lists.linux.it
Message-ID: <YLRaAWP7A0RdleuX@pevik>
References: <20210531032910.6739-1-pvorel@suse.cz>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210531032910.6739-1-pvorel@suse.cz>
Authentication-Results: imap.suse.de;
	none
X-Spam-Level: 
X-Spam-Score: 0.50
X-Spamd-Result: default: False [0.50 / 100.00]; ARC_NA(0.00)[];
 HAS_REPLYTO(0.00)[pvorel@suse.cz]; REPLYTO_EQ_FROM(0.00)[];
 FROM_HAS_DN(0.00)[]; RCPT_COUNT_THREE(0.00)[3];
 TO_MATCH_ENVRCPT_ALL(0.00)[]; MIME_GOOD(-0.10)[text/plain];
 RCVD_VIA_SMTP_AUTH(0.00)[]; TO_DN_SOME(0.00)[];
 DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
 RCVD_NO_TLS_LAST(0.10)[]; FROM_EQ_ENVFROM(0.00)[];
 MIME_TRACE(0.00)[0:+]; MID_RHS_NOT_FQDN(0.50)[];
 RCVD_COUNT_TWO(0.00)[2]
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] doc: Drop uClinux support
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
Cc: Mike Frysinger <vapier@gentoo.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCgpbQ2M6IE1pa2UgXQo+IFNpZ25lZC1vZmYtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6Pgo+IC0tLQo+IEhpLAoKPiBzb21lIHNob3J0ZXIgZm9ybSBjb3VsZCBiZSBhZGRlZCB0byAz
LiBUZXN0IENvbnRyaWJ1dGlvbiBDaGVja2xpc3QgWzFdIGFzIHdlbGwuCgo+IEtpbmQgcmVnYXJk
cywKPiBQZXRyCgo+IFsxXSBodHRwczovL2dpdGh1Yi5jb20vbGludXgtdGVzdC1wcm9qZWN0L2x0
cC93aWtpL1Rlc3QtV3JpdGluZy1HdWlkZWxpbmVzIzMtdGVzdC1jb250cmlidXRpb24tY2hlY2ts
aXN0Cgo+ICBkb2MvbWFpbnRhaW5lci1wYXRjaC1yZXZpZXctY2hlY2tsaXN0LnR4dCB8IDMgKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKCj4gZGlmZiAtLWdpdCBhL2RvYy9t
YWludGFpbmVyLXBhdGNoLXJldmlldy1jaGVja2xpc3QudHh0IGIvZG9jL21haW50YWluZXItcGF0
Y2gtcmV2aWV3LWNoZWNrbGlzdC50eHQKPiBpbmRleCA1NDIwZmE5MzMuLjgxZWQ2MWRkZiAxMDA2
NDQKPiAtLS0gYS9kb2MvbWFpbnRhaW5lci1wYXRjaC1yZXZpZXctY2hlY2tsaXN0LnR4dAo+ICsr
KyBiL2RvYy9tYWludGFpbmVyLXBhdGNoLXJldmlldy1jaGVja2xpc3QudHh0Cj4gQEAgLTQ0LDYg
KzQ0LDkgQEAgTmV3IHRlc3Qgc2hvdWxkCj4gICogRG9jcGFyc2UgZG9jdW1lbnRhdGlvbgo+ICAq
IElmIGEgdGVzdCBpcyBhIHJlZ3Jlc3Npb24gdGVzdCBpdCBzaG91bGQgaW5jbHVkZSB0YWdzCj4g
ICAgKG1vcmUgaW4gaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvd2lr
aS9UZXN0LVdyaXRpbmctR3VpZGVsaW5lcyMyMjM4LXRlc3QtdGFnc1tUZXN0IHRhZ3NdKQo+ICsq
IFdoZW4gcmV3cml0dGluZyBvbGQgdGVzdHMsIGh0dHBzOi8vZW4ud2lraXBlZGlhLm9yZy93aWtp
LyVDRSU5Q0NsaW51eFt1Q2xpbnV4Cj4gKyAgKM68Q2xpbnV4KV0gc3VwcG9ydCBzaG91bGQgYmUg
cmVtb3ZlZCAocHJvamVjdCBoYXMgYmVlbiBkaXNjb250aW51ZWQpLgo+ICsgIEUuZy4gYEZPUktf
T1JfVkZPUksoKWAgc2hvdWxkIGJlIHJlcGxhY2VkIHdpdGggc2ltcGxlIGBmb3JrKClgIG9yIGBT
QUZFX0ZPUksoKWAuCgo+ICAjIyMgU2hlbGwgdGVzdHMKPiAgKiBVc2UgbmV3IGh0dHBzOi8vZ2l0
aHViLmNvbS9saW51eC10ZXN0LXByb2plY3QvbHRwL3dpa2kvVGVzdC1Xcml0aW5nLUd1aWRlbGlu
ZXMjMjMtd3JpdGluZy1hLXRlc3RjYXNlLWluLXNoZWxsW3NoZWxsIEFQSV0KCkZZSTogaHR0cHM6
Ly9naXRodWIuY29tL3VjbGludXgtZGV2CgpCdXQgdGhhdCdzIGp1c3QgYXJjaGl2aW5nIHRoZSBw
cm9qZWN0LCBpdCdzIHNhZmUgdG8gcmVtb3ZlIHVjbGludXggc3VwcG9ydCBmcm9tCkxUUC4KCktp
bmQgcmVnYXJkcywKUGV0cgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxp
bnV4Lml0L2xpc3RpbmZvL2x0cAo=
