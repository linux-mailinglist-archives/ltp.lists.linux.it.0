Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id eOUrJpZJn2lEZwQAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 20:12:22 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D17219C9A9
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 20:12:21 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1772046741; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=mn1nxrK0MpsyVgGcaEVK392VsXi1d8BdpW0KvNvl3gU=;
 b=WTUBe02XUqEOK3DsujB3i9s/7QS47uJmk8g6xN1bIbX52SRWv3OHPrgi7Wp2EmDMKXJBs
 Az3OFihC/iYUMF5lGt0AGG/ptxtSaaXhXnp2E3VrFChebIcZitqxGi7TDqZdlp9BCBwMNyl
 ff+b3E/LGeXYjni/y+Pcnk1vrsnsxBU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4AFB53CB277
	for <lists+linux-ltp@lfdr.de>; Wed, 25 Feb 2026 20:12:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 860F73C8529
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 20:12:07 +0100 (CET)
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 905C42009C0
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 20:12:07 +0100 (CET)
Received: by mail-ed1-x533.google.com with SMTP id
 4fb4d7f45d1cf-65c4152313fso141580a12.1
 for <ltp@lists.linux.it>; Wed, 25 Feb 2026 11:12:07 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772046727; cv=none;
 d=google.com; s=arc-20240605;
 b=McTUZRKo9z3OeHWHTSZzZOXHiGw4M5gFM2GFFiLXoGcyzEwxwdbEhWtiq71K6snlUr
 50sx0EZenKa5EeMgbBU878WaYy+v7O0es2E4GlSC4gZ9Mm3oPQMTrqRB84pB+XaGDPw0
 JKi3K3IJLChSXRWEY6mjqJxpKpJxpBE0qtGuY7gXmN9C0PRIF3J53OSig9zp+2QecZnn
 Tm2kleEGIJHRpUVAS/9lFhXIOspcPw1m4OQw60aEtxLFt0uO8IuH5TK8xqZGjTHqT1gX
 2GVP4m2p3wmwtALcIcTKnziefXvi9pebmL1+mxayvqGfjq/13eeErXuR0MFzNdQIZd4e
 jktg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20240605; 
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:dkim-signature;
 bh=hxWo2M1hfHbazeBgsTKZh65gretcUhTfTjAHMxSDkGg=;
 fh=6Ce3lMZuCUUwHXdhwDyenAacaiy348J4pBnf+jP7qiA=;
 b=hirDaVhkRT/deJZzx1c1QDFBmaojF0kBwmrLtPW4la0hOpOeEG0+h3G+2ij9SkUl1o
 91n/zp44foCuXkExYgXXGAikGtNW/kXBJZo2ACb9TWGDPVOlvK0usJFgqalE1SjEaAHd
 AMy8B85HKTm/nqTaT4+M+a4t6BI+a5AbshQtc9m5CxVsr+F+AlCccRBKPknDs+hXVMXI
 2Uz29YRx+kh6DrRLFAZdSmgcgZJZjULGIh5s0klYLtJfaBhbouXaPtOgathXSyfJmZHq
 2JIReqbJ+HngsUKCY1aLQIryRAywfDDNHlCd6vMF9bpzFFe+sVEilddWnS1MPWpmCx1S
 tmSA==; darn=lists.linux.it
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=google.com; s=20230601; t=1772046727; x=1772651527; darn=lists.linux.it;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=hxWo2M1hfHbazeBgsTKZh65gretcUhTfTjAHMxSDkGg=;
 b=MPE3t1B4t8hLAEr8u9EfbOmxJIZeBYrXHfxZpbBSoTnmwDP1gCeKRd1LDLDSqOESo0
 8smNJ9vG/ibV0TxCftlJlQUzrSJc/4VFecfYb95rlLBlqcit3iugQ9YfhvyWeuDiEu23
 5qb2KDIgJpD8RaB70bKlusZO5M0o3YeXJj36V+JIpXLt+upsme9IOLkdbMcogx/qpp+z
 iBijNJAfqWJ/AGdeynfaRf4zvCoolZyhTNHQdqxQTOXk3aRa/GaMbkE7ykL9oNgPYxs0
 jbt1tLjcKJOu7HK93MZir9gKzb0curg/L6AECd+sHh6rxUZMM44mztovm3BSXUkeCtEe
 AGfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772046727; x=1772651527;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=hxWo2M1hfHbazeBgsTKZh65gretcUhTfTjAHMxSDkGg=;
 b=EVxTOGCo5JHBSqU1pFwDaJtwua8fD5GG4YEkw0BvoYNySXkA9dFR7H+klHEe+p9RiW
 2CE7ldlmKOCLoEw4knyGZUIXzSmw2i9tbZc3FjOPfaNeh9ODFzBoeVaauVLZjzjYL9Kc
 1Ps1pDtIGFzsEn3Ka6uWm5+0Krts14t6ID5tEbCtexaXt/ArzA+j8IAdrqK2ZbNxp0ck
 w0zVnfUGwo6N9FLxq/kiFaC+WzpGhwktls/YFsO8qRHiAs0WB19MKcWrSI6qN4K0szRe
 dGX4dGm5MUyn2/t7tMDf7CskLvZRJp+YX0Rh12VdZSG3j8+Frdr0RTAwosfBwwblJmyV
 Y/1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCWZslnYYZWnJziNioPHy9aDEkzmqrGElEWGBxROPWdRhAD91/6elHwqtfWYTwuw54j65sY=@lists.linux.it
X-Gm-Message-State: AOJu0Yx5OiMx+jqQ+xx+dSqk1pop8IB0z3EGkDIWUQTelwwM7kRgH2To
 /9dhvC6NDCmtnsjA18RolukTc7Sn1xJVKL02ruM0AmfMds6OWvUQon7czZ4SoS4Hq3Ux79B0WRj
 KUndfG2TDPpi1ETHRbmo7sccgB61dhgm32Pl1KU8=
X-Gm-Gg: ATEYQzx461z1wyWuZrKFAqZRVO1j6JzfGGlCCshLDcHSdJZpu2vw8BAjNLYh85P4cRY
 AxM02UJG/Q6bq1E0m1TKW8gNQokM8BQ5wLG5bq4PmuUvuUEPB0YQd1+5UytLv4Sm9Pc8Dj0LCOO
 y7921fBA83xbuuaY0Nvzi8SrJchzcHjxZY5aOt3Kr/RfAF8g/b0JXzCUIxZ8tdkyFEaQwRaj9Zv
 lJV79cvGytSIkb02qIMkqMrWAceraxMhsK14vu7qAo4AYihxOcfK7mOLSqMBI8pVrUdIAeXyHW0
 hWg6sL+hHmJZt/3iGecYWqJ0/Wkco8N/Jmheqj4HirAWwIw=
X-Received: by 2002:a17:907:3e05:b0:b83:95c8:15d0 with SMTP id
 a640c23a62f3a-b9081c1880bmr1217005266b.52.1772046726396; Wed, 25 Feb 2026
 11:12:06 -0800 (PST)
MIME-Version: 1.0
References: <20260224104544.101292-1-japo@linux.ibm.com>
 <CANDhNCrrZY=5bvRQGGJsigjwRNmDz8shbtM-Vtn5UkdRDGU_uA@mail.gmail.com>
 <DGNXMJ74NVTB.2DY53W36K3GET@suse.com>
In-Reply-To: <DGNXMJ74NVTB.2DY53W36K3GET@suse.com>
Date: Wed, 25 Feb 2026 11:11:53 -0800
X-Gm-Features: AaiRm51veiYi30YtmRHAPR3MWXpp2zhvEuOwOT12ZQMHoMlM6eTUSaIAUJFKAmM
Message-ID: <CANDhNCqASmDD99T_viiAnRz55otuNWAzvx-JL8Td8Q_=Qjwgyg@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.com>
X-Spam-Status: No, score=-14.9 required=7.0 tests=ARC_SIGNED,ARC_VALID,
 DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
 ENV_AND_HDR_SPF_MATCH,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL,
 USER_IN_DEF_SPF_WL shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH v1 1/1] sched_football: harden kickoff
 synchronization on high-CPU systems
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
From: John Stultz via ltp <ltp@lists.linux.it>
Reply-To: John Stultz <jstultz@google.com>
Cc: Linux Test Project <ltp@lists.linux.it>,
 Steven Rostedt <rostedt@goodmis.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.11 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	TO_DN_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_MIXED(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	R_DKIM_REJECT(0.00)[google.com:s=20230601];
	TAGGED_RCPT(0.00)[linux-ltp];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	NEURAL_HAM(-0.00)[-0.999];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MISSING_XM_UA(0.00)[];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	HAS_REPLYTO(0.00)[jstultz@google.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,google.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.com:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: 2D17219C9A9
X-Rspamd-Action: no action

T24gV2VkLCBGZWIgMjUsIDIwMjYgYXQgMToyM+KAr0FNIEFuZHJlYSBDZXJ2ZXNhdG8KPGFuZHJl
YS5jZXJ2ZXNhdG9Ac3VzZS5jb20+IHdyb3RlOgo+IE9uIFR1ZSBGZWIgMjQsIDIwMjYgYXQgMTA6
MDMgUE0gQ0VULCBKb2huIFN0dWx0eiB2aWEgbHRwIHdyb3RlOgo+ID4gT24gVHVlLCBGZWIgMjQs
IDIwMjYgYXQgMjo0NeKAr0FNIEphbiBQb2xlbnNreSA8amFwb0BsaW51eC5pYm0uY29tPiB3cm90
ZToKPiA+ID4KPiA+ID4gVGhlIHNjaGVkX2Zvb3RiYWxsIHRlc3QgaGFzIGJlZW4gaW50ZXJtaXR0
ZW50bHkgZmFpbGluZywgbW9zdCBub3RpY2VhYmx5Cj4gPiA+IG9uIHN5c3RlbXMgd2l0aCBtYW55
IENQVXMgYW5kL29yIHVuZGVyIGxvYWQsIGR1ZSB0byBhIHN0YXJ0dXAgb3JkZXJpbmcKPiA+ID4g
aG9sZSBhcm91bmQga2lja29mZi4KPiA+ID4KPiA+Cj4gPiBJJ3ZlIG5vdCBoYWQgdGltZSB0byBj
bG9zZWx5IHJldmlldyB5b3VyIHN1Z2dlc3Rpb24gaGVyZSwgYnV0IGl0Cj4gPiBzb3VuZHMgcmVh
c29uYWJsZS4KPiA+Cj4gPiBUaGF0IHNhaWQsIEkgd2FudCB0byB3YXJuIHlvdSBhbmQgZW5zdXJl
IHlvdSBhcmUgYXdhcmU6IHRoZQo+ID4gUlRfUFVTSF9JUEkgZmVhdHVyZSBpbiB0aGUgc2NoZWR1
bGVyIGJyZWFrcyB0aGUgUlQgaW52YXJpYW50Cj4gPiBzY2hlZF9mb290YmFsbCBpcyB0ZXN0aW5n
Lgo+ID4KPiA+IEkgc2VlIHRoaXMgYXMgYSBidWcgd2l0aCB0aGF0IGZlYXR1cmUsIGJ1dCB0aGUg
c2NhbGFiaWxpdHkgUlRfUFVTSF9JUEkKPiA+IGFsbG93cyBmb3Igc2VlbXMgbW9yZSBpbXBvcnRh
bnQgdG8gZm9sa3Mgd2hvIGFyZSBkb2luZyBSVCB3b3JrIHRoZW4KPiA+IHRoZSBtaXMtYmVoYXZp
b3IuICBTdGV2ZW4gYW5kIEkgdGFsa2VkIGF3aGlsZSBiYWNrIGFib3V0IHNvbWUgaWRlYXMgb24K
PiA+IGhvdyB3ZSBtaWdodCBiZSBhYmxlIHRvIGRvIHRoZSBwdWxsIGluIGEgbW9yZSBlZmZpY2ll
bnQgd2F5IHdoaWxlCj4gPiBzdGlsbCBob2xkaW5nIHRoZSBpbnZhcmlhbnQgdHJ1ZSwgYW5kIEkg
aGF2ZSBhIGJ1ZyB0byB0cmFjayBpdCwgYnV0Cj4gPiBpdHMgbm90IGJlZW4gaGlnaCBlbm91Z2gg
cHJpb3JpdHkgdG8gZ2V0IGJhbmR3aWR0aCB5ZXQuCj4gPgo+ID4gU28geW91IG1pZ2h0IHdhbnQg
dG8gbWFrZSBzdXJlIHlvdSBkaXNhYmxlIHRoYXQgZmVhdHVyZSBiZWZvcmUgdGVzdGluZyB2aWE6
Cj4gPiAjIGVjaG8gTk9fUlRfUFVTSF9JUEkgPiAvc3lzL2tlcm5lbC9kZWJ1Zy9zY2hlZC9mZWF0
dXJlcwo+ID4KPiA+IHRoYW5rcwo+ID4gLWpvaG4KPgo+IFRoYW5rcyBmb3IgeW91ciBkZWVwIGFu
YWx5c2lzIG9uIHRoZSBwb3NzaWJsZSBpc3N1ZS4gSSdtIG5vdCBhbiBSVCBleHBlcnQsCj4gYnV0
IEkgdHJ1c3QgeW91ciBleHBlcnRpc2UgaW4gaGVyZSA6LSkgV2lsbCBsZWF2ZSB0aGlzIHBhdGNo
IHJldmlldyB0bwo+IHNvbWVvbmUgd2hvJ3MgbW9yZSBza2lsbGVkIHRoYW4gbWUgaW4gdGhpcyB0
b3BpYy4KPgo+IEkgaGF2ZSBhIHN1Z2dlc3Rpb24gdGhvLgo+Cj4gQWJvdXQgdGhlIE5PX1JUX1BV
U0hfSVBJLCB3ZSBhcmUgbHVja3k6IExUUCBwcm92aWRlcyBhIHNhZmUgbWVjaGFuaXNtIHRvCj4g
c2V0IHRoZSBzeXMgY29uZmlndXJhdGlvbnMgYW5kIHRvIHJlc3RvcmUgaXQgdG8gZGVmYXVsdCB2
YWx1ZSBhZnRlcgo+IHRlc3QuIFlvdSBjYW4gZmluZCB0aGlzIGluIHRoZSBgc3RydWN0IHRzdF90
ZXN0YCBhbmQgaXQncyBjYWxsZWQKPiBgLnNhdmVfcmVzdG9yZWAgWzFdCj4KPiBJIHRoaW5rIGl0
J3Mgd29ydGggdG8gZm9yY2UgdGhpcyBvcHRpb24gYWNjb3JkaW5nIHRvIHRoZSB1bmRlcmx5aW5n
Cj4gdmFyaWFudCAoYW5kIHByb3Blcmx5IGRvY3VtZW50IHRoaXMgaW4gdGhlIGNvZGUgd2l0aCBh
IGNvbW1lbnQpLgo+Cj4gV0RZVD8KClRoYXQgc2VlbXMgcmVhc29uYWJsZSwgYXMgbG9uZyBhcyBp
dCdzIGNsZWFybHkgbGFiZWxlZCBhcyBhIHdvcmthcm91bmQKYW5kIGhvcGVmdWxseSBjYW4gYmUg
ZHJvcHBlZCAob3Iga2VybmVsIHZlcnNpb24gbGltaXRlZCkgd2hlbiB0aGUKaXNzdWUgaXMgZmlu
YWxseSBhZGRyZXNzZWQuCgp0aGFua3MKLWpvaG4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0
cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
