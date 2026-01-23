Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GCeWDMvNcmlgpgAAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 02:24:27 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id BBAC36F092
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 02:24:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769131466; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=SbOPhV9w8deZitoAUsPkORPgzRxHnuiw8Phr8IOS0bY=;
 b=O1gsOPFCvBNWNI/dvjiABZId3mi5nP0tuLM9d1oKXCrIsh1ODWlGSTrpVB3AuUORjxe6o
 bW3UTiPSe0HCD3zkky+b6OtqbFX+jlGWS5fGAK12UMEduvZDmCHkPz2JerabyJklpkVf2S8
 Q2QpZrcWSQpcXBNnWa/JKsDqf6VcUYg=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 008A13CAFA6
	for <lists+linux-ltp@lfdr.de>; Fri, 23 Jan 2026 02:24:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id DA4733C7C2C
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 02:24:21 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.133.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 08F65140005F
 for <ltp@lists.linux.it>; Fri, 23 Jan 2026 02:24:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769131458;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=G1qv3eywnuBZbufBT/5ag78J5gNnMMEJulXy3e+SSMw=;
 b=gErJ8XkuTSUgQbGFJWEpjhflkxNZd9GkbG1df/C4VKu54UfzArJefHnk0JxGoQFGQRiHS1
 vWV9UcGao4OAuxINjfP7A+UCrdGGyyIBdraSIzMIKL63Pj7Y5NKem8q7XRb02kCbQEL1A8
 evGQegiFeu5GUyRrvY5KfY7wYGwVMh8=
Received: from mail-dl1-f69.google.com (mail-dl1-f69.google.com
 [74.125.82.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-624-oscyBQ3WPQCljf_scCZaLQ-1; Thu, 22 Jan 2026 20:24:16 -0500
X-MC-Unique: oscyBQ3WPQCljf_scCZaLQ-1
X-Mimecast-MFC-AGG-ID: oscyBQ3WPQCljf_scCZaLQ_1769131455
Received: by mail-dl1-f69.google.com with SMTP id
 a92af1059eb24-11b21dfe918so1192956c88.0
 for <ltp@lists.linux.it>; Thu, 22 Jan 2026 17:24:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769131455; x=1769736255;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=G1qv3eywnuBZbufBT/5ag78J5gNnMMEJulXy3e+SSMw=;
 b=RARvYSypP5yESfRIhw3Eeo3FU5QpWnPxWIHN34AHFPy8dqJBRZRFb2rq/ws23tsVdR
 6WQncwSxdDTuj5VyHIiNtFFtStEV9fE1v7EQ3AXO0WFNrsWDdjFLB5GTAzVAXvaEMilo
 LYBXmbtKLSjfRZy/03opg0K1REAXwBPj3R2yNA8kIv5EeWn9M8M8CV3m5xAYiJR4tTZ5
 TAcZI0E0eWq7rR1fJ8XFSvWmydhoiTH8TIM+e45h0cXyIytDhReOunQcoGF3ueuRDL9U
 DM7lXw6javV46Pj84+48G2AYWOvIixu0n/7vUu+XDrm1+5o5vN3TdDhbqQMNg0j5C29B
 R0fw==
X-Gm-Message-State: AOJu0Ywctvvh6rKOC8ZM3H+VmouvzTpnUcd2UWX0kAohvzNHEdJvUcYV
 MkIKGuj5BOC2l0XFAgAHIyhQZ/FPFlCDUKKej7O0r1AyHSLFuVeH9kkCcegs12K0qRFrfQ2F3Wx
 TdmZjzEJYxsytovIsBWdCAeZrHLsftKidVZogABeMuNu1vBhDa7I/8vl3wyGMsj0CAVO5u/iaul
 B3SyKSaEUaaKgk22imzQwjy3pPhpw=
X-Gm-Gg: AZuq6aLUcfDd5xAMzJ0mkZ/yp5EGOpqQN4WAiI8VtFFp5UlVNwLmO12i2XlL7b5K59q
 Tn7llQKR+LWlhsfRS3Vhuh0kF+OQx3jLsRRcLxZ3PqZdxjM9dPMvrvW4edXK2bo0b2hSrZjeFka
 KQbRIhJinrkQeafHaUOUANYxJd/iFQq/WkCalzYROzJr5lNv5r1TzcX+KEWQN2FaIqZZY=
X-Received: by 2002:a05:7022:e19:b0:11b:ca88:c4f1 with SMTP id
 a92af1059eb24-1247d77f52fmr689079c88.20.1769131455364; 
 Thu, 22 Jan 2026 17:24:15 -0800 (PST)
X-Received: by 2002:a05:7022:e19:b0:11b:ca88:c4f1 with SMTP id
 a92af1059eb24-1247d77f52fmr689064c88.20.1769131454704; Thu, 22 Jan 2026
 17:24:14 -0800 (PST)
MIME-Version: 1.0
References: <20260122175354.83833-1-pvorel@suse.cz>
In-Reply-To: <20260122175354.83833-1-pvorel@suse.cz>
Date: Fri, 23 Jan 2026 09:24:02 +0800
X-Gm-Features: AZwV_QgA63U9LD-IfN7vSDFQfVsws_x9yPJrRgialB2r2lcI_190TE90f5cbEs4
Message-ID: <CAEemH2ciW+Z5gq-8Lsjkpd+VEK9uZ=vKdsjHviZyttDVt+G28A@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: e1CJyK7uVx6fR_fSFQs5DXuBdXgU_wvKl7bWwgysBDc_1769131455
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS shortcircuit=no
 autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-6.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] lapi/tls.h: Cleanup ifdefs
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
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.11 / 15.00];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	R_SPF_ALLOW(-0.20)[+a];
	MAILLIST(-0.20)[mailman];
	R_DKIM_ALLOW(-0.20)[lists.linux.it:s=picard];
	MIME_BASE64_TEXT(0.10)[];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,linux-ltp=lfdr.de];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_MIXED(0.00)[];
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
	ASN(0.00)[asn:12779, ipnet:2001:1418::/29, country:IT];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.cz:email,linux.it:url,mail.gmail.com:mid,lists.linux.it:dkim,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: BBAC36F092
X-Rspamd-Action: no action

UmV2aWV3ZWQtYnk6IExpIFdhbmcgPGxpd2FuZ0ByZWRoYXQuY29tPgoKLS0gClJlZ2FyZHMsCkxp
IFdhbmcKCk9uIEZyaSwgSmFuIDIzLCAyMDI2IGF0IDE6NTTigK9BTSBQZXRyIFZvcmVsIDxwdm9y
ZWxAc3VzZS5jej4gd3JvdGU6Cj4KPiBmZTI0MTk2Y2UzIGFkZGVkIC5zdXBwb3J0ZWRfYXJjaHMg
aW50byBjbG9uZTEwLiBUaGVyZWZvcmUgdGhlcmUgaXMgbm8KPiBuZWVkIHRvIGtlZXAgYXJjaGl0
ZWN0dXJlIGNoZWNrIGFsc28gaW4gbGFwaS90bHMuaC4KPgo+IE1vcmVvdmVyICJVbnN1cHBvcnRl
ZCBhcmNoaXRlY3R1cmUgZm9yIFRMUyIgd2FzIG1pc2xlYWRpbmcgYXMgaXQgbG9va2VkCj4gYXMg
YSBtaXNzaW5nIGFyY2ggc3VwcG9ydCBpbiBrZXJuZWwsIGJ1dCBpdCdzIG91ciBhbGxvY2F0ZV90
bHNfYXJlYSgpCj4gaW1wbGVtZW50YXRpb24gd2hpY2ggZG9lcyBzdXBwb3J0IG9ubHkgMyBhcmNo
aXRlY3R1cmVzLgo+Cj4gU2lnbmVkLW9mZi1ieTogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+
Cj4gLS0tCj4gSGksCj4KPiBiYXNlZCBvbiBhIHJlY2VudCBkaXNjdXNzaW9uIG9uIE1MCj4gaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbHRwLzIwMjYwMTIyMTMwNjM0LkdBNzEyMTRAcGV2aWsvCj4K
PiBLaW5kIHJlZ2FyZHMsCj4gUGV0cgo+Cj4gIGluY2x1ZGUvbGFwaS90bHMuaCB8IDYgLS0tLS0t
Cj4gIDEgZmlsZSBjaGFuZ2VkLCA2IGRlbGV0aW9ucygtKQo+Cj4gZGlmZiAtLWdpdCBhL2luY2x1
ZGUvbGFwaS90bHMuaCBiL2luY2x1ZGUvbGFwaS90bHMuaAo+IGluZGV4IGY3ZTJmNDgzZmUuLjQ2
OGZlMzA4NmQgMTAwNjQ0Cj4gLS0tIGEvaW5jbHVkZS9sYXBpL3Rscy5oCj4gKysrIGIvaW5jbHVk
ZS9sYXBpL3Rscy5oCj4gQEAgLTUyLDIyICs1MiwxNiBAQCBzdGF0aWMgaW5saW5lIHZvaWQgKmFs
bG9jYXRlX3Rsc19hcmVhKHZvaWQpCj4KPiAgc3RhdGljIGlubGluZSB2b2lkIGluaXRfdGxzKHZv
aWQpCj4gIHsKPiAtI2lmIGRlZmluZWQoX194ODZfNjRfXykgfHwgZGVmaW5lZChfX2FhcmNoNjRf
XykgfHwgZGVmaW5lZChfX3MzOTB4X18pCj4gICAgICAgICB0bHNfcHRyID0gYWxsb2NhdGVfdGxz
X2FyZWEoKTsKPiAtI2Vsc2UKPiAtICAgICAgIHRzdF9icmsoVENPTkYsICJVbnN1cHBvcnRlZCBh
cmNoaXRlY3R1cmUgZm9yIFRMUyIpOwo+IC0jZW5kaWYKPiAgfQo+Cj4gIHN0YXRpYyBpbmxpbmUg
dm9pZCBmcmVlX3Rscyh2b2lkKQo+ICB7Cj4gICAgICAgICB1c2xlZXAoMTAwMDApOwo+IC0jaWYg
ZGVmaW5lZChfX3g4Nl82NF9fKSB8fCBkZWZpbmVkKF9fYWFyY2g2NF9fKSB8fCBkZWZpbmVkKF9f
czM5MHhfXykKPiAgICAgICAgIGlmICh0bHNfcHRyKSB7Cj4gICAgICAgICAgICAgICAgIGZyZWUo
dGxzX3B0cik7Cj4gICAgICAgICAgICAgICAgIHRsc19wdHIgPSBOVUxMOwo+ICAgICAgICAgfQo+
IC0jZW5kaWYKPiAgfQo+Cj4gICNlbmRpZiAvKiBMQVBJX1RMU19IX18gKi8KPiAtLQo+IDIuNTEu
MAo+CgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBz
Oi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
