Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id B9BD04C66BA
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 10:59:54 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 83A693CA293
	for <lists+linux-ltp@lfdr.de>; Mon, 28 Feb 2022 10:59:54 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 02B103C229A
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 10:59:49 +0100 (CET)
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.220.28])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id F027C60068E
 for <ltp@lists.linux.it>; Mon, 28 Feb 2022 10:59:48 +0100 (CET)
Received: from relay2.suse.de (relay2.suse.de [149.44.160.134])
 by smtp-out1.suse.de (Postfix) with ESMTP id 334A6218D9;
 Mon, 28 Feb 2022 09:59:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
 t=1646042388;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMdoFmLOWiIp09i4chfoyOVMQJs3TS+vfEB1u8Pz/SI=;
 b=GTMifYtayyp6z+Eek2X61uMzPdBnYnl3EQRNmVDVwEWsbCtOfS4pbOvIi9bB4//QZKSHoE
 0Vayd6YtYrfYpX4dLphxAKYPgzxfuzgt0TE97gwwhQp1WPeVy/oUFjcfWJUOg16i6RAzVn
 WCtyV+bh06dex7aJAe/u/xBeO/Iu3Xg=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
 s=susede2_ed25519; t=1646042388;
 h=from:from:reply-to:reply-to:date:date:message-id:message-id:to:to:
 cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=NMdoFmLOWiIp09i4chfoyOVMQJs3TS+vfEB1u8Pz/SI=;
 b=tdr5fGnbuPj566J8E6x0C7AsJhV+2JwItQ9pYqpNr9800ptWd9g2cCyiFCoc6l4Uiizgbb
 mPC2iz6lvCjIMgCA==
Received: from g78 (unknown [10.163.24.138])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by relay2.suse.de (Postfix) with ESMTPS id ED1EDA3BB2;
 Mon, 28 Feb 2022 09:59:47 +0000 (UTC)
References: <20220222124547.14396-1-rpalethorpe@suse.com>
 <20220222124547.14396-2-rpalethorpe@suse.com>
 <20220222145311.GB12037@blackbody.suse.cz>
User-agent: mu4e 1.6.10; emacs 27.2
From: Richard Palethorpe <rpalethorpe@suse.de>
To: Michal =?utf-8?Q?Koutn=C3=BD?= <mkoutny@suse.com>
Date: Mon, 28 Feb 2022 09:22:54 +0000
In-reply-to: <20220222145311.GB12037@blackbody.suse.cz>
Message-ID: <87y21via5o.fsf@suse.de>
MIME-Version: 1.0
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v3 1/2] API/cgroup: Expose memory_recursiveprot V2
 mount opt
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
Reply-To: rpalethorpe@suse.de
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGVsbG8gTWljaGFsLAoKTWljaGFsIEtvdXRuw70gPG1rb3V0bnlAc3VzZS5jb20+IHdyaXRlczoK
Cj4gT24gVHVlLCBGZWIgMjIsIDIwMjIgYXQgMTI6NDU6NDZQTSArMDAwMCwgUmljaGFyZCBQYWxl
dGhvcnBlIDxycGFsZXRob3JwZUBzdXNlLmNvbT4gd3JvdGU6Cj4+IFRoaXMgY2hhbmdlcyB0aGUg
ZWZmZWN0IG9mIHRydW5rIG5vZGVzJyBtZW1vcnkubG93IGFuZCBtZW1vcnkubWluIG9uCj4+IHRo
ZWlyIGxlYWYgbm9kZXMuIFNvIHdlIG5lZWQgdG8gY2hhbmdlIHRoZSBleHBlY3RhdGlvbnMgb2Yg
c29tZSB0ZXN0cy4KPgo+IEhvdyBtdWNoIGFyZSBMVFAgcnVucyBzdHJpdmluZyB0byBub3QgYWZm
ZWN0IGVudmlyb25tZW50PwoKQXMgYSBnZW5lcmFsIHJ1bGUgd2UgdHJ5IHRvIGxlYXZlIHRoZSBl
bnZpcm9ubWVudCBhcyB3ZSBmb3VuZCBpdCBzbyB0aGF0CnRlc3RpbmcgaXMgbW9yZSBkZXRlcm1p
bmlzdGljLiBGb3IgdGhlIENHcm91cCB0ZXN0aW5nIGluIHBhcnRpY3VsYXIgSQpkZWNpZGVkIG5v
dCB0byBjaGFuZ2UgYW55dGhpbmcgc28gdGhhdCB3ZSBkbyBub3QgaGF2ZSB0byB3b3JyeSBhYm91
dCBob3cKdGhlIGluaXQgc3lzdGVtIHdpbGwgcmVhY3QuCgo+IElJUkMsIHRoZSBtZW1vcnlfcmVj
dXJzaXZlcHJvdCBpcyAicmVtb3VudGFibGUiOyBpbiB0aGUgbG9uZy10ZXJtIGl0J3MKPiBsaWtl
bHkgd29ydGggd2F0Y2hpbmcgdGhlIG1lbW9yeV9yZWN1cnNpdmVwcm90IGJlaGF2aW9yIG9ubHku
Cj4KPiBJLmUuIGluc3RlYWQgb2YgY2FycnlpbmcgdHdvIHNldHMgb2YgZXhwZWN0YXRpb25zIHlv
dSBjYW4gd2FycCB0aGUKPiBlbnZpcm9ubWVudCBmb3IgdGhlIHNldCB0aGF0J3MgbW9yZSBsaWtl
bHkuCj4KPiBNaWNoYWwKClRoaW5raW5nIGFib3V0IGl0LCB0aGUgcmVhc29uIHdoeSBJIHdhcyB0
ZXN0aW5nIHdpdGhvdXQKbWVtb3J5X3JlY3Vyc2l2ZXByb3QgaXMgYmVjYXVzZSBJJ20ganVzdCBk
aXJlY3QgYm9vdGluZyB0aGUga2VybmVsIHdpdGgKYmFzaCBhcyBpbml0IGFuZCBydW5uaW5nIHRo
ZSB0ZXN0LiBTbyB0aGUgTFRQIGlzIG1vdW50aW5nIHRoZSBDR3JvdXBzCmFuZCBpdCBzaG91bGQg
bW91bnQgd2l0aCBtZW1vcnlfcmVjdXJzaXZlcHJvdCwgYnV0IGl0IGlzIG5vdC4KClByb2JhYmx5
IHdlIGhhdmUgdG8gc3VwcG9ydCBvbGRlciBwcm9kdWN0cyBhcyB3ZWxsIHdoaWNoIGRvbid0IGhh
dmUKbWVtb3J5X3JlY3Vyc2l2ZXByb3QgZW5hYmxlZCBhbmQgYXJlIHVzaW5nIFYyICh1bmxpa2Vs
eSBJIGd1ZXNzLCBidXQgaXQKaXMgc2FmZXN0IHRvIGFzc3VtZSB0aGlzIGlzIHRoZSBjYXNlKS4g
U28gd2UgY2FuIHN0aWxsIHJ1biB0aGUgdGVzdCwgYnV0CnJlcG9ydCBDT05GIGluc3RlYWQgb2Yg
UEFTUy9GQUlMLiBUaGlzIHdheSB3ZSB3aWxsIGF0IGxlYXN0IHN0aWxsIGNhdGNoCmtlcm5lbCB3
YXJuaW5ncyBhbmQgcGFuaWNzLgoKLS0gClRoYW5rIHlvdSwKUmljaGFyZC4KCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
