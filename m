Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IFM7ODhyimn3KQAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Feb 2026 00:48:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 90EE9115714
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Feb 2026 00:48:08 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1770680888; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : content-type :
 content-transfer-encoding : sender : from;
 bh=Pe5PFBFskkK+tMjrMPDG4hYXAzbhpm9q0uHHBLQC4aw=;
 b=ig+E7aqSCNH2IJTyWPXyoF/nxqFqMoBHhgiELJW5vzFI8RKGr+W/PXPNyLedjW1IqKqpJ
 goYGZjNg3fymeVCK5qz/R1z+Ih9nm6bltDXWgk85Ny4W9/cqD7OZ1tQqGDHaR6eKW3/d0Kl
 WPKRxHeLCVtREwHCrWazoM7icnXtMLk=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 4301A3CBC03
	for <lists+linux-ltp@lfdr.de>; Tue, 10 Feb 2026 00:48:08 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9B0C3C98BE
 for <ltp@lists.linux.it>; Tue, 10 Feb 2026 00:47:54 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id D6C322000C0
 for <ltp@lists.linux.it>; Tue, 10 Feb 2026 00:47:53 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1770680872;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=+NSZdUQEQRGOniCob83m0/HCbcwED5O2TO27VhT87Jc=;
 b=RPQmVKgmj254Fg8cdNwiv2H9pSGLDC5nihtq/3TiW5h2X0p19kzPe6TiMsCh39fl2qFK84
 iJjla4SuFQa+pcIxuFflSdIQ6sQ7YBoM9BAVvIXtyvAOg2vLyumWd3jh8jeLauFCJRuXJW
 9wMxDd/BH7U6p5eoFxNXSSom3g1WbZs=
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-274-JrscIar_O5-RyR3kE736-A-1; Mon, 09 Feb 2026 18:47:50 -0500
X-MC-Unique: JrscIar_O5-RyR3kE736-A-1
X-Mimecast-MFC-AGG-ID: JrscIar_O5-RyR3kE736-A_1770680870
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8950562d351so213823966d6.3
 for <ltp@lists.linux.it>; Mon, 09 Feb 2026 15:47:50 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1770680870; x=1771285670;
 h=to:subject:message-id:date:from:in-reply-to:references:mime-version
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=+NSZdUQEQRGOniCob83m0/HCbcwED5O2TO27VhT87Jc=;
 b=oiWMotR2S8n2z60wNhgpbPUa9z/ZotQrfy/6+nxWsH+VVxOjKtv4mxu53aMzswBC4a
 Er6GWFbEVUJZcGz5FickLTSYQKaKhT51j7BSCbb6qDs2nNSODxw2H2rFvp2I+lMaF+by
 8XzL52uljKy1GrB0juCDDw2YyBtxBQkccbhEbR6pdsqfIUG0WaUbGIppElW05d9L7pUM
 As7J1sTjN5Sz6ARmKJ6OoprT8pd4M67lsngnnJc3iPfSEBeC8gmITS12cShtgF3n+tCl
 kI8E+IaIqZ0m8ZQ1WyKj5yCU1tdVaXc1ZV4pXMKPTAXr0IpeomJglWkufMYM3bdQE5o3
 0XrA==
X-Gm-Message-State: AOJu0YxPQiuxzfmPc0fE7dh0HrJLst0nmVyOnCb68x/YZZNkXFvziawR
 MbEiJSXKMwpjxnRAlSfAoQpO0sg72yipXjxP9CXnR9PHEehHItqb+uPp4zc7ePFa66JdcMIxvq1
 aopU0n8MijVT2D82MBSn6oNYVLKwyh1rdrDESx6B/6z0gfD0JBt3mgC+mVmBuSRWVV23SQZzwHk
 o7IFVDSLRhyVTn7Xa/mlwIwYmdZetvZxggcmYEMg==
X-Gm-Gg: AZuq6aIHlQuyPbA8Ueqpfj+ZoTjEEqw8xxcVRxEncqn6AdJKi/Y8tdxXRWMTHlBihBZ
 hDHMnMeEjKut/BU1MrCooL21SVUBSamx4jFwtzPqpG4Kc3m29dYGP0c3/3SkafX7FUPUFLr+/nY
 dseqODKk+urQdALZKndFeDmFa9+YFwKmkB796zR0gJXDpEWU7V4KD0jVWMDLVnU+ugC7D1q0WmK
 9TZqA==
X-Received: by 2002:a05:6214:313:b0:896:a692:cac9 with SMTP id
 6a1803df08f44-896a692cc7bmr80223656d6.33.1770680870109; 
 Mon, 09 Feb 2026 15:47:50 -0800 (PST)
X-Received: by 2002:a05:6214:313:b0:896:a692:cac9 with SMTP id
 6a1803df08f44-896a692cc7bmr80223506d6.33.1770680869634; Mon, 09 Feb 2026
 15:47:49 -0800 (PST)
MIME-Version: 1.0
References: <20260209233657.2809468-1-sbertram@redhat.com>
In-Reply-To: <20260209233657.2809468-1-sbertram@redhat.com>
Date: Mon, 9 Feb 2026 18:47:38 -0500
X-Gm-Features: AZwV_Qidg5o-DdD0uXhzxXcyP3ldMgH8Kc16VO67YAlu1SYfBkuF68OlchFPCTo
Message-ID: <CAD_=S2kB7RQOwuP8goiCPFDk+8LLuRnktWTQKjDCnpteKLjsJQ@mail.gmail.com>
To: ltp@lists.linux.it
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: CNNCS1WhX6zqsgIMwt__54usSccZlgmBDdMKno_cEwg_1770680870
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-7.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v1] mq_timedreceive01: fails sometimes with
 EEXIST. When run in parallel you can sometimes get the following error:
 TBROK: mq_open(/test_mqueue, 194, 0700, (nil)) failed: EEXIST (17)
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
From: Stephen Bertram via ltp <ltp@lists.linux.it>
Reply-To: Stephen Bertram <sbertram@redhat.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a:c];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	TO_EQ_FROM(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_ONE(0.00)[1];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	RCVD_COUNT_FIVE(0.00)[5];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	FROM_HAS_DN(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	HAS_REPLYTO(0.00)[sbertram@redhat.com];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,picard.linux.it:helo,picard.linux.it:rdns,lists.linux.it:dkim]
X-Rspamd-Queue-Id: 90EE9115714
X-Rspamd-Action: no action

SGkgVGVhbSwKCkkgc2F3IG15IGlzc3VlIGFmdGVyIHNlbmRpbmcgdGhlIGVtYWlsLiBDYW4geW91
IHBsZWFzZSBjbG9zZSB0aGlzIG9uZT8gSQpjbGVhbmVkIHVwIGFuZCBzdWJtaXR0ZWQgdGhpcyB0
byByZXBsYWNlIGl0LApodHRwczovL2xpc3RzLmxpbnV4Lml0L3BpcGVybWFpbC9sdHAvMjAyNi1G
ZWJydWFyeS8wNDY0ODUuaHRtbC4KCnRoYW5rIHlvdSwKCnN0ZXBoZW4KSGUvSGlzL0hpbQoKCk9u
IE1vbiwgRmViIDksIDIwMjYgYXQgNjozN+KAr1BNIFN0ZXBoZW4gQmVydHJhbSA8c2JlcnRyYW1A
cmVkaGF0LmNvbT4gd3JvdGU6Cgo+IFRoaXMgY2hhbmdlIGFsbG93cyBmb3IgdW5pcXVlIHF1ZXVl
IG5hbWVzIHBlcgo+IHByb2Nlc3MsIHdoZW4gZXhlY3V0ZWQgaW4gcGFyYWxsZWwgd2l0aCAtdyAj
Lgo+IC0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3V0aWxzL21xLmggfCAxNSArKysr
KysrKystLS0tLS0KPiAgMSBmaWxlIGNoYW5nZWQsIDkgaW5zZXJ0aW9ucygrKSwgNiBkZWxldGlv
bnMoLSkKPgo+IGRpZmYgLS1naXQgYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL3V0aWxzL21x
LmgKPiBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXRpbHMvbXEuaAo+IGluZGV4IGRhNDVk
MmRhZi4uZWI2NjMyOGQ1IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMv
dXRpbHMvbXEuaAo+ICsrKyBiL3Rlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvdXRpbHMvbXEuaAo+
IEBAIC0xMiw5ICsxMiw5IEBACj4KPiAgI2RlZmluZSBNQVhfTVNHU0laRSAgICA4MTkyCj4gICNk
ZWZpbmUgTVNHX0xFTkdUSCAgICAgMTAKPiAtI2RlZmluZSBRVUVVRV9OQU1FICAgICAiL3Rlc3Rf
bXF1ZXVlIgo+IC0jZGVmaW5lIFFVRVVFX05BTUVfTk9OQkxPQ0sgICAgIi90ZXN0X21xdWV1ZV9u
b25ibG9jayIKPgo+ICtzdGF0aWMgY2hhciBxdWV1ZV9uYW1lWzY0XTsKPiArc3RhdGljIGNoYXIg
cXVldWVfbmFtZV9ub25ibG9ja1s2NF07Cj4gIHN0YXRpYyBjaGFyIHNtc2dbTUFYX01TR1NJWkVd
Owo+ICBzdGF0aWMgc3RydWN0IHNpZ2FjdGlvbiBhY3Q7Cj4KPiBAQCAtMjksOCArMjksOCBAQCBz
dGF0aWMgdm9pZCBjbGVhbnVwX2NvbW1vbih2b2lkKQo+ICAgICAgICAgaWYgKGZkX25vbmJsb2Nr
ID4gMCkKPiAgICAgICAgICAgICAgICAgU0FGRV9DTE9TRShmZF9ub25ibG9jayk7Cj4KPiAtICAg
ICAgIG1xX3VubGluayhRVUVVRV9OQU1FKTsKPiAtICAgICAgIG1xX3VubGluayhRVUVVRV9OQU1F
X05PTkJMT0NLKTsKPiArICAgICAgIG1xX3VubGluayhxdWV1ZV9uYW1lKTsKPiArICAgICAgIG1x
X3VubGluayhxdWV1ZV9uYW1lX25vbmJsb2NrKTsKPiAgfQo+Cj4gIHN0YXRpYyB2b2lkIHNpZ2hh
bmRsZXIoaW50IHNpZyBMVFBfQVRUUklCVVRFX1VOVVNFRCkgeyB9Cj4gQEAgLTM5LDE0ICszOSwx
NyBAQCBzdGF0aWMgdm9pZCBzZXR1cF9jb21tb24odm9pZCkKPiAgewo+ICAgICAgICAgaW50IGk7
Cj4KPiArICAgICAgIHNucHJpbnRmKHF1ZXVlX25hbWUsIHNpemVvZihxdWV1ZV9uYW1lKSwgIi90
ZXN0X21xdWV1ZV8lZCIsCj4gZ2V0cGlkKCkpOwo+ICsgICAgICAgc25wcmludGYocXVldWVfbmFt
ZV9ub25ibG9jaywgc2l6ZW9mKHF1ZXVlX25hbWVfbm9uYmxvY2spLAo+ICIvdGVzdF9tcXVldWVf
bm9uYmxvY2tfJWQiLCBnZXRwaWQoKSk7Cj4gKwo+ICAgICAgICAgYWN0LnNhX2hhbmRsZXIgPSBz
aWdoYW5kbGVyOwo+ICAgICAgICAgc2lnYWN0aW9uKFNJR0lOVCwgJmFjdCwgTlVMTCk7Cj4KPiAg
ICAgICAgIGNsZWFudXBfY29tbW9uKCk7Cj4KPiAgICAgICAgIGZkX3Jvb3QgPSBTQUZFX09QRU4o
Ii8iLCBPX1JET05MWSk7Cj4gLSAgICAgICBmZCA9IFNBRkVfTVFfT1BFTihRVUVVRV9OQU1FLCBP
X0NSRUFUIHwgT19FWENMIHwgT19SRFdSLCAwNzAwLAo+IE5VTEwpOwo+IC0gICAgICAgZmRfbm9u
YmxvY2sgPSBTQUZFX01RX09QRU4oUVVFVUVfTkFNRV9OT05CTE9DSywgT19DUkVBVCB8IE9fRVhD
TCB8Cj4gT19SRFdSIHwKPiArICAgICAgIGZkID0gU0FGRV9NUV9PUEVOKHF1ZXVlX25hbWUsIE9f
Q1JFQVQgfCBPX0VYQ0wgfCBPX1JEV1IsIDA3MDAsCj4gTlVMTCk7Cj4gKyAgICAgICBmZF9ub25i
bG9jayA9IFNBRkVfTVFfT1BFTihxdWV1ZV9uYW1lX25vbmJsb2NrLCBPX0NSRUFUIHwgT19FWENM
IHwKPiBPX1JEV1IgfAo+ICAgICAgICAgICAgICAgICBPX05PTkJMT0NLLCAwNzAwLCBOVUxMKTsK
Pgo+ICAgICAgICAgZm9yIChpID0gMDsgaSA8IE1BWF9NU0dTSVpFOyBpKyspCj4gLS0KPiAyLjUy
LjAKPgo+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlz
dGluZm8vbHRwCg==
