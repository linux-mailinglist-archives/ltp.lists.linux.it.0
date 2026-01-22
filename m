Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 4KkQLscYcmksawAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:32:07 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF7A66AA4
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:32:07 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id B2BBF3CB4C1
	for <lists+linux-ltp@lfdr.de>; Thu, 22 Jan 2026 13:32:06 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 010133CAEBB
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:32:02 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de
 [IPv6:2a07:de40:b251:101:10:150:64:1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 48128600A86
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 13:32:01 +0100 (CET)
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org
 [IPv6:2a07:de40:b281:104:10:150:64:97])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by smtp-out1.suse.de (Postfix) with ESMTPS id CEA9333702;
 Thu, 22 Jan 2026 12:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769085121;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9sfc7SctuQHLwP/h6hrOjirJ9nFG+7Yq79MuZqqkxw=;
 b=Aou+ELDKoZjMz3ztFb685bZKgIZ+Jt1TkbAwsYrXDxo1t9L2LJbP0Tl2xpp1sEEureBDw4
 lR2xE5Ch+CdY1XfHB+kO+hnuFn40Bv2lULAQbauTa/4G7/jQWjXghQg6VlMjBkXtJk2J6Z
 BYCVcgCLeEFvVz+ZaCKiXEWDMkXkJNY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769085121;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9sfc7SctuQHLwP/h6hrOjirJ9nFG+7Yq79MuZqqkxw=;
 b=/oP2ZgwWoF4mUepRn8icDtWoeepI23WD52R/njrmqqmu1QjnFIeaX7wQnPW56IveR1sgxt
 JLddLHXAFp2GrCBw==
Authentication-Results: smtp-out1.suse.de;
 dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=xj5XSvyv;
 dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=bK3ykWAT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
 t=1769085120;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9sfc7SctuQHLwP/h6hrOjirJ9nFG+7Yq79MuZqqkxw=;
 b=xj5XSvyv6ldnUuECo8DO5ZqkKph36raR5wF32ZQQL3IBLB23FvJodbEyoKx7jLNcjWTVBJ
 LyFf6bc0bRtnTAP+Qetb7Wp6h+MsOSq2HOjYEtFVO4smPUmLfV20PffxrFuZ6UV0utFtk+
 nVTupprX1Ek7JRfKVpIGbTMLTgYt3e4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
 s=susede2_ed25519; t=1769085120;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=O9sfc7SctuQHLwP/h6hrOjirJ9nFG+7Yq79MuZqqkxw=;
 b=bK3ykWAT6c4GaJGaGd3nBv09I60qbCz7nEjCeJCtaA2RKdKKHqEpa2hTKh4MRjFT+4tpR4
 n/p8fgxCcpx5QVAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
 (No client certificate requested)
 by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 998C01395E;
 Thu, 22 Jan 2026 12:32:00 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
 by imap1.dmz-prg2.suse.org with ESMTPSA id v3nuI8AYcmlcCwAAD6G6ig
 (envelope-from <pvorel@suse.cz>); Thu, 22 Jan 2026 12:32:00 +0000
Date: Thu, 22 Jan 2026 13:31:54 +0100
From: Petr Vorel <pvorel@suse.cz>
To: Jan Stancek <jstancek@redhat.com>
Message-ID: <20260122123154.GC64562@pevik>
References: <20260122102606.87754-1-liwang@redhat.com>
 <CAASaF6w3S2STiyS9LvOsK_uVEvRoO6uq=XNMG-cMNheC0k1RHg@mail.gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <CAASaF6w3S2STiyS9LvOsK_uVEvRoO6uq=XNMG-cMNheC0k1RHg@mail.gmail.com>
X-Spam-Score: -3.71
X-Spam-Level: 
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] clone10: add support archs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.09 / 15.00];
	R_DKIM_REJECT(1.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	MID_RHS_NOT_FQDN(0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	DMARC_NA(0.00)[suse.cz];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux.it:url,linux.it:email,suse.cz:replyto,suse.cz:email,picard.linux.it:helo,picard.linux.it:rdns];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWO(0.00)[2];
	FORGED_SENDER_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_TRACE(0.00)[suse.cz:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[pvorel@suse.cz,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	HAS_REPLYTO(0.00)[pvorel@suse.cz];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	REPLYTO_EQ_FROM(0.00)[]
X-Rspamd-Queue-Id: 0BF7A66AA4
X-Rspamd-Action: no action

SGkgTGksIEphbiwKCj4gT24gVGh1LCBKYW4gMjIsIDIwMjYgYXQgMTE6MjbigK9BTSBMaSBXYW5n
IHZpYSBsdHAgPGx0cEBsaXN0cy5saW51eC5pdD4gd3JvdGU6Cgo+ID4gU2lnbmVkLW9mZi1ieTog
TGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Cj4gPiAtLS0KPiA+ICB0ZXN0Y2FzZXMva2VybmVs
L3N5c2NhbGxzL2Nsb25lL2Nsb25lMTAuYyB8IDYgKysrKysrCj4gPiAgMSBmaWxlIGNoYW5nZWQs
IDYgaW5zZXJ0aW9ucygrKQoKPiA+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2Nh
bGxzL2Nsb25lL2Nsb25lMTAuYyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY2xvbmUvY2xv
bmUxMC5jCj4gPiBpbmRleCBhNTJhYzM1NjguLjlmZmI0OWMzNyAxMDA2NDQKPiA+IC0tLSBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvY2xvbmUvY2xvbmUxMC5jCj4gPiArKysgYi90ZXN0Y2Fz
ZXMva2VybmVsL3N5c2NhbGxzL2Nsb25lL2Nsb25lMTAuYwo+ID4gQEAgLTkxLDQgKzkxLDEwIEBA
IHN0YXRpYyBzdHJ1Y3QgdHN0X3Rlc3QgdGVzdCA9IHsKPiA+ICAgICAgICAgLmNsZWFudXAgPSBj
bGVhbnVwLAo+ID4gICAgICAgICAubmVlZHNfY2hlY2twb2ludHMgPSAxLAo+ID4gICAgICAgICAu
dGVzdF9hbGwgPSB2ZXJpZnlfdGxzLAo+ID4gKyAgICAgICAuc3VwcG9ydGVkX2FyY2hzID0gKGNv
bnN0IGNoYXIgKmNvbnN0IFtdKSB7Cj4gPiArICAgICAgICAgICAgICAgIng4Nl82NCIsCj4gPiAr
ICAgICAgICAgICAgICAgImFhcmNoNjQiLAo+ID4gKyAgICAgICAgICAgICAgICJzMzkweCIsCj4g
PiArICAgICAgICAgICAgICAgTlVMTAo+ID4gKyAgICAgICB9Cj4gPiAgfTsKCj4gQWNrZWQtYnk6
IEphbiBTdGFuY2VrIDxqc3RhbmNla0ByZWRoYXQuY29tPgoKTEdUTS4gSW5kZWVkIG9ubHkgdGhl
c2UgMyBhcmNocyBkb24ndCBUQ09ORi4KQWNrZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PgoKT3V0IG9mIGN1cmlvc2l0eSwgd2hlcmUgaXMgdGhlIHN1cHBvcnQgZGVmaW5lZCBpbiBr
ZXJuZWw/CiJpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpIiBpcyBpbiBtYW55IGFyY2hz
OgoKJCBnaXQgZ3JlcCBDTE9ORV9TRVRUTFMKLi4uCmFyY2gvbG9vbmdhcmNoL2tlcm5lbC9wcm9j
ZXNzLmM6MjIwOiAgICBpZiAoY2xvbmVfZmxhZ3MgJiBDTE9ORV9TRVRUTFMpCmFyY2gvbTY4ay9r
ZXJuZWwvcHJvY2Vzcy5jOjE3OTogaWYgKGNsb25lX2ZsYWdzICYgQ0xPTkVfU0VUVExTKQphcmNo
L21pY3JvYmxhemUva2VybmVsL3Byb2Nlc3MuYzoxMTA6ICAgaWYgKGNsb25lX2ZsYWdzICYgQ0xP
TkVfU0VUVExTKQphcmNoL21pcHMva2VybmVsL3Byb2Nlc3MuYzoxNzE6IGlmIChjbG9uZV9mbGFn
cyAmIENMT05FX1NFVFRMUykKYXJjaC9uaW9zMi9rZXJuZWwvcHJvY2Vzcy5jOjE0MzogICAgICAg
IGlmIChjbG9uZV9mbGFncyAmIENMT05FX1NFVFRMUykKYXJjaC9vcGVucmlzYy9rZXJuZWwvcHJv
Y2Vzcy5jOjE5OTogICAgICAgICAgICAgICogRm9yIENMT05FX1NFVFRMUyBzZXQgInRwIiAocjEw
KSB0byB0aGUgVExTIHBvaW50ZXIuCmFyY2gvb3BlbnJpc2Mva2VybmVsL3Byb2Nlc3MuYzoyMDE6
ICAgICAgICAgICAgIGlmIChjbG9uZV9mbGFncyAmIENMT05FX1NFVFRMUykKYXJjaC9wYXJpc2Mv
a2VybmVsL3Byb2Nlc3MuYzoyNTE6ICAgICAgICAgICAgICAgaWYgKGNsb25lX2ZsYWdzICYgQ0xP
TkVfU0VUVExTKQphcmNoL3Bvd2VycGMva2VybmVsL3Byb2Nlc3MuYzoxODE5OiAgICAgICAgICAg
ICAgICAgICAgIGlmIChjbG9uZV9mbGFncyAmIENMT05FX1NFVFRMUykgewoKS2luZCByZWdhcmRz
LApQZXRyCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
