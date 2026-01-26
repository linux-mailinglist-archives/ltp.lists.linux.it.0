Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id kFc8J6oDd2k1agEAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 07:03:22 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 34C5E845DC
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 07:03:22 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769407401; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=Wu7Oliao9NgcdzonzM07B7RMZXScp8qorcOHataOWpM=;
 b=fOZh2az7/MJMI1QjYwThCe1L71PwdmZcCEDwFyCmR39gcTnWWuZK6avZY6y5NcKqwrYP7
 YoFrdDtmBzX23bub/PKqIIP02eZyySvEd7GPuGWq2/CazIiohBDYm6BO8hjwCnTxYeP3zjH
 qcwJqrotdLqs9az5n5HBg8mB5dGKgfU=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id BDD233C1C0B
	for <lists+linux-ltp@lfdr.de>; Mon, 26 Jan 2026 07:03:21 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 76C9E3C0206
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 07:03:17 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 049011400992
 for <ltp@lists.linux.it>; Mon, 26 Jan 2026 07:03:15 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769407394;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=jdWUNiVslYZfNtB8cUZS+sGoAD8PcC/72T0RruAC3r0=;
 b=fTqLtSDu6Z7sG45xu1ndw2jCPcczlMu3Pc83JImkbbFiYBR+WsFRwptEUplXswqkoT9IHm
 VW+dy/q5TvaV+4MvD3d8AJHz6SiFO4o/ojHxsXgNaUQg1MtEWNTPncuMB1CjACj9x8zRrj
 T3/Nl+Cmg34L0Skln/g0Im5DblsI9cw=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-329-xZsda2GROYWuEyiWYCF_Cw-1; Mon, 26 Jan 2026 01:03:12 -0500
X-MC-Unique: xZsda2GROYWuEyiWYCF_Cw-1
X-Mimecast-MFC-AGG-ID: xZsda2GROYWuEyiWYCF_Cw_1769407391
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b704019c98so4178305eec.0
 for <ltp@lists.linux.it>; Sun, 25 Jan 2026 22:03:11 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769407391; x=1770012191;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jdWUNiVslYZfNtB8cUZS+sGoAD8PcC/72T0RruAC3r0=;
 b=d2GdHowrdiKU8XasuyjvnCnxQssNfW64RvpaVBgHr0DaU6SyQAYzGPaoKVRKH9WCQx
 22eQZ5aw1u7/j7QgEzg7A55uRBd7XTGR7BwB7VVF9zdTzobkr2YUAwe/XI34qB5JaBrF
 OOdba1/Ctxn4FTPDuXs3l4L70Ajsn2J9axPZMQ8eEvn3PB4dH6z2Tve9134GXncTzNLo
 HcKw0m4jhGfCtVocJ1vHodf4q6lGH+N18C/ulm+WK05Koz5uNzHn9f/dck3WmOmKKQbg
 WnnPNRx/rAtMTWb7Tz+5BWd37t1Jgvv+uOaxM/SGhvvtyyd6PC3dFVSaOibUy165dAG5
 CMJA==
X-Gm-Message-State: AOJu0YzOVjEqloMh4RHfub0H43nvUeZ++IGL5kCgPtQuSw1bnNx0Sc64
 TL/J2eboZnLucbV38EPua6P/z5ofMVs1xqAYyURuKDyWxF6upM7aYv7l2F+PGTufUw060MhJClN
 DZYF7DGSe6lmIORMv6ATMpcbF9fh8dq+68YeK4/B4rBrKY8CrjMBPVaStVCq/QJBTS0XgFD+XeD
 87zs/gR9qNCW5Lp/9qPrlUNXaRZWk=
X-Gm-Gg: AZuq6aIHkMoFc/KBcWSZ7mAwYSOO8GeJ+YTAl+34H7YA9mlDoA8VsP/jX5LOSKmVaqT
 pFhKCy8WJBojTNDrZPynxiwG3OqwQuSP6Eyt/XPnuYyrvSSTg9ISAKo9Ae/v+17xDMqTuPnOXzZ
 b1rkZ946L8br/HqZt7Q9ecBufPeh/ql1rcmpd31yLBSOFsFAz87gGY0IJsU6eugGT+6iA=
X-Received: by 2002:a05:7300:d512:b0:2b7:3240:5412 with SMTP id
 5a478bee46e88-2b764828fc2mr1696002eec.39.1769407390716; 
 Sun, 25 Jan 2026 22:03:10 -0800 (PST)
X-Received: by 2002:a05:7300:d512:b0:2b7:3240:5412 with SMTP id
 5a478bee46e88-2b764828fc2mr1695993eec.39.1769407390222; Sun, 25 Jan 2026
 22:03:10 -0800 (PST)
MIME-Version: 1.0
References: <20260123054056.131992-1-liwang@redhat.com>
 <20260123094538.GA113458@pevik>
 <CAEemH2c2pzwLcr+70_67oQ4aTqsTE004MnrLEPZgfvk-G1B+pg@mail.gmail.com>
 <20260123115317.GA117991@pevik>
 <CAEemH2dUZcuX7PoXGM2OgdB7O9F=ctoYjcWpLDA7tGxHYJqp3g@mail.gmail.com>
 <20260123122545.GA122331@pevik>
In-Reply-To: <20260123122545.GA122331@pevik>
Date: Mon, 26 Jan 2026 14:02:56 +0800
X-Gm-Features: AZwV_Qg6-LQrM8D4BJs664sQG5Ypu4hNzarW0J9k9iMPA92N_aDVO45nixeTRLU
Message-ID: <CAEemH2e+CT8yEQfjqbHEqbfp9vzeeh62gfEkQLgQZ9qfNZSYiQ@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: OUGNyLDDvDd2hZfJPhAzV9fijAnoETKWDVHoSwUmgmU_1769407391
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH] userfaultfd05: handle kernels rejecting WP
 feature in UFFDIO_API
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
From: Li Wang via ltp <ltp@lists.linux.it>
Reply-To: Li Wang <liwang@redhat.com>
Cc: Ricardo Branco <rbranco@suse.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+a];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	DKIM_MIXED(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[linux-ltp];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	RCPT_COUNT_THREE(0.00)[3];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[mail.gmail.com:mid,linux.it:url,suse.cz:email]
X-Rspamd-Queue-Id: 34C5E845DC
X-Rspamd-Action: no action

T24gRnJpLCBKYW4gMjMsIDIwMjYgYXQgODoyNeKAr1BNIFBldHIgVm9yZWwgPHB2b3JlbEBzdXNl
LmN6PiB3cm90ZToKCj4gPiA+IFllcywgZm9yIHRoZSBkaXNjdXNzaW9uIHdoZW4gdG8gdXNlIEkn
ZCBwcm9wb3NlIHRvICpub3QqIHVzZSBrY29uZmlnCj4gTWF5YmUgdG8gY29ycmVjdCBteXNlbGY6
Cj4KPiAqVXNlKiBrY29uZmlnIGlmIHRoZXJlIGlzIG5vIG90aGVyIHdheSB0byBkZXRlY3QgdGhl
IGZ1bmN0aW9uYWxpdHkgWzFdLgo+IFdlIHByZWZlciB0byB1c2Uga2NvbmZpZyBkZXRlY3Rpb24s
IGJ1dCBkbyAqbm90KiB1c2Uga2NvbmZpZyB3aGVuIHRoZXJlIGlzCj4gYW5vdGhlciB3YXkgdG8g
ZGV0ZWN0IHRoZSBmdW5jdGlvbmFsaXR5IChlLmcuIHZpYSBkZXRlY3RpbmcgZnVuY3Rpb25hbGl0
eQo+IHZpYQo+IC9wcm9jfHN5cykgKmFuZCogYW5kIG9uZSBvZiB0aGVzZSB0aHJlZSBydWxlczoK
Pgo+ID4gPiAqIGJvb3QgcGFyYW1ldGVyIHRvIGVuYWJsZS9kaXNhYmxlIGV4aXN0Cj4gKiBhbGxv
dyB0byBkaXNhYmxlIHZpYSBrZXJuZWwgYm9vdCBwYXJhbWV0ZXIgb3IgdmlhIC9zeXMgZmlsZQo+
ID0+IGJlY2F1c2UgaXQgY2FuIGJlIGRpc2FibGVkCj4gPiA+ICogY2hlY2sgZm9yIHRyaXN0YXRl
IChmdW5jdGlvbmFsaXR5IHdoaWNoIGNhbiBiZSBjb21waWxlZCBhcyBtb2R1bGUpCj4gPT4gbW9k
dWwgbWlnaHQgbm90IGJlIGF2YWlsYWJsZQo+ID4gPiAqIGtlcm5lbCBuZXcgZnVuY3Rpb25hbGl0
eSB3aGljaCBpcyB1bmxpa2VseSB0byBiZSBiYWNrcG9ydGVkICh1c2UKPiAubWluX2t2ZXIgaW5z
dGVhZCkKPiA9PiBwcm9iYWJseSBmYXN0ZXIKPgo+ID4gVGhhdCBzb3VuZHMgZ3JlYXQgdG8gbWUu
Cj4KPiBUaGFuayB5b3UhCj4KPiA+IEFuZCwgcGx1cyBvbmUgbW9yZToKPiA+ICAgICoga2NvbmZp
ZyBmaWxlIG1heSBiZSB1bmF2YWlsYWJsZSBmb3Igc29tZSByZWFzb25zCj4KPiBZZXMsIGJ1dCB3
ZSBnYXZlIHVwIG9uIHRoaXMgKG9yIGF0IGxlYXN0IEN5cmlsKSBbMV06Cj4KPiAgICAgICAgIEFz
IGZvciB0aGUgbWlzc2luZyBjb25maWcgdGhlcmUgaXMgOTUgdGVzdGNhc2VzIHRoYXQgaGF2ZQo+
IG5lZWRzX2tjb25maWdzCj4gICAgICAgICBzZXQgYXQgdGhpcyBtb21lbnQgYW5kIHRoZSBudW1i
ZXIgaXMgZ3Jvd2luZyBzdGVhZGlseS4gSSB3b3VsZAo+IGFyZ3VlCj4gICAgICAgICB0aGF0IHlv
dSBjYW5ub3QgcnVuIExUUCB3aXRob3V0IGhhdmluZyBjb25maWcgYXZhaWxhYmxlLiBBbmQgdGhl
Cj4gY29uZmlnCj4gICAgICAgICBsb2NhdGlvbiBpcyBhdXRvZGV0ZWN0ZWQgb24gY29tbW9uIGRp
c3RyaWJ1dGlvbnMgYXMgd2VsbC4KPgo+IG1lOiArIGF0IGxlYXN0IDIgSU1BIHRlc3RzIHJlcXVp
cmUga2NvbmZpZyB2aWEgdHN0X3JlcXVpcmVfa2NvbmZpZ3MoKS4KPgo+IFRoZXJlZm9yZSBJIGFj
Y2VwdGVkIGl0IGFuZCBJJ20gbm90IGFnYWluc3QgdXNpbmcga2NvbmZpZy4gQnV0IEkgd291bGQK
PiBwcmVmZXIKPiB1c2luZyBpdCBvbmx5IHdoZW4gaXQgd29ya3MgcmVsaWFibHkgKDEwMCUpLgo+
CgpNYWtlIHNlbnNlIQoKCj4gS2luZCByZWdhcmRzLAo+IFBldHIKPgo+IFsxXSBodHRwczovL2xv
cmUua2VybmVsLm9yZy9sdHAvYVY2RENibnMwMkU0QkNUakB5dWtpLmxhbi8KPgo+CgotLSAKUmVn
YXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4
Lml0L2xpc3RpbmZvL2x0cAo=
