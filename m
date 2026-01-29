Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
Delivered-To: lists+linux-ltp@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IPV2AMQxe2kVCQIAu9opvQ
	(envelope-from <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>)
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 11:09:08 +0100
X-Original-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 72DD4AE682
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 11:09:07 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1769681347; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=4eD8NiO4XShg6tMx3NjBhMt5J/aPUDRr5Ahts4OYAfg=;
 b=QdvOVZmt65LOujC3znsKkuK/p5aodGt8fsyxCNyXzzEoPMbT28MOAjc380ZgqVdD2Fe8Z
 VsX0iOkqJAs5BGr5szWRDfS7ESjmnXR9KtL+d82v754bwoSLUpkP/xeSgwqVXmi9c504aGz
 SZbayBt282H6MrUrvMKgAFt8/krkSlY=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 11F793CBEC2
	for <lists+linux-ltp@lfdr.de>; Thu, 29 Jan 2026 11:09:07 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 34FF53CBE37
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 11:09:04 +0100 (CET)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 2DFB06008E3
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 11:09:02 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1769681341;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=28SkU/8hRCo9+Pz1+MfgruAe7FkbE0d5neCgECkd9XM=;
 b=b8awEXn/m7Y6o/7Kolp1Ds2tZs/CO7qTnRfXOoWdWaoIAd9wLrscbgrSm4onfm5GsufmGP
 kN/kDQfMydR15L6iT8+YkBJDSCxgmznZh2N7iIuxkf8nyYEicjYJcXw7sS6U8Cj0Z7JCK0
 hzYGvFq3knH7J3JMaehw8Gq1RaXQoE8=
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com
 [74.125.82.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-593-oY9KYT4NOw2IWQQay3LYYw-1; Thu, 29 Jan 2026 05:09:00 -0500
X-MC-Unique: oY9KYT4NOw2IWQQay3LYYw-1
X-Mimecast-MFC-AGG-ID: oY9KYT4NOw2IWQQay3LYYw_1769681339
Received: by mail-dy1-f198.google.com with SMTP id
 5a478bee46e88-2b6b9c1249fso1232383eec.1
 for <ltp@lists.linux.it>; Thu, 29 Jan 2026 02:08:59 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769681338; x=1770286138;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=28SkU/8hRCo9+Pz1+MfgruAe7FkbE0d5neCgECkd9XM=;
 b=vkyr1wJM+hmk2jn3UUWvB23rxXEcp7RFxVyzw+BIFYfeDSwnWWH0TXlBqdQpN5VVQV
 3VUFZGiJX9NDYZa0J32Yem/hfXTxkOpkqF+iX7/0c3Nm5vKMHWdCi1gwJU2hMC/ykCXA
 gQZgX4kO71z4Az9EOUcxjLMXBKWa14u5XIzSRbqdCFP4jqJDKIgGT4OLbbGYHr/B2jRk
 OyI3kns4xXbYW+e76LBI3yFruSzfIwaOgcz2JWXfeNrvybpFPsq6yIgYt8XanCjOCN2I
 c3MVmY+9A5QHcu7qtPb+WKrFFg6GwNoVlvAVXfYeydIRphAkyAVxjVBbpEVi0q3lhM2U
 RJzA==
X-Gm-Message-State: AOJu0YwNr7Imq4xYoFdJh6Iov3pCntoRuTdUFfrWCkZQFEzQTZo+PrTZ
 j5/NUtwyKKIkR/FmwhQncEZL0baVl+OL1Aq9EtqJ6APgdPdBptu5pLPGojmaO0R0nnwgdl+a+Ae
 qpuFid/4ZToz65yotHLS1dtx5yu8ssxahFo5KNLnpkDvK/96GJdNlHOk/b7ncWChJ1MKWYzSUbO
 laueO43ushGk2lScTGQW7z1JyXux5FwTOPdwObwg==
X-Gm-Gg: AZuq6aJ3X7wy4e2fZrlg6i97XjMc65uM9FgLe9qfjAgS4/yITxQNqYdP2noV18oZwF6
 +JPnYHpGUv/nLkDTGG7oNohMetMChbRgeqP9eDo3F6EYp3ucfQrZOJZjqXdRZ1JwOLB+fT1dv/L
 mY9kANB7lLQQXq28RGY5H5jJHO5pfZbZdHezFTcq0KD4JBdpgtZRMZ03fZoIv0rEC6moo=
X-Received: by 2002:a05:7301:678b:b0:2b7:3424:d42b with SMTP id
 5a478bee46e88-2b78da676ebmr4641697eec.37.1769681337749; 
 Thu, 29 Jan 2026 02:08:57 -0800 (PST)
X-Received: by 2002:a05:7301:678b:b0:2b7:3424:d42b with SMTP id
 5a478bee46e88-2b78da676ebmr4641689eec.37.1769681337297; Thu, 29 Jan 2026
 02:08:57 -0800 (PST)
MIME-Version: 1.0
References: <20260129100011.72437-1-liwang@redhat.com>
In-Reply-To: <20260129100011.72437-1-liwang@redhat.com>
Date: Thu, 29 Jan 2026 18:08:45 +0800
X-Gm-Features: AZwV_QjivoHrTYHhuUZrhHMSSDnqc6PllcECQ4ljn3CyNraIo8TwS-O-5mWM6zo
Message-ID: <CAEemH2fppgf4iJE4h1n3XSMw9v-hMF11BZAYjz_-9dHgKv0iFg@mail.gmail.com>
To: Li Wang <liwang@redhat.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 6UoOnIrs6NYFPQpV1Z3tzll0QFZIUaRTParGTEBg21c_1769681339
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_PASS,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.9 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] cve-2017-17052: tolerate ENOMEM during test
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
	R_SPF_ALLOW(-0.20)[+a:c];
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
	R_DKIM_REJECT(0.00)[redhat.com:s=mimecast20190719];
	DMARC_POLICY_ALLOW(0.00)[lists.linux.it,none];
	HAS_REPLYTO(0.00)[liwang@redhat.com];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_FIVE(0.00)[5];
	FROM_NEQ_ENVFROM(0.00)[ltp@lists.linux.it,ltp-bounces@lists.linux.it];
	REPLYTO_DOM_NEQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-ltp];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:12779, ipnet:213.254.0.0/19, country:IT];
	DKIM_TRACE(0.00)[lists.linux.it:+,redhat.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linux.it:dkim,linux.it:url,linux.it:email,picard.linux.it:helo,picard.linux.it:rdns]
X-Rspamd-Queue-Id: 72DD4AE682
X-Rspamd-Action: no action

T24gVGh1LCBKYW4gMjksIDIwMjYgYXQgNjowMOKAr1BNIExpIFdhbmcgdmlhIGx0cCA8bHRwQGxp
c3RzLmxpbnV4Lml0PiB3cm90ZToKPgo+IEFzIGVhY2ggaXRlcmF0aW9uIG9mIG1tYXBfdGhyZWFk
KCkgZ3JhYnMgYSBmcmVzaCAxNuKAr01pQiBNQVBfUE9QVUxBVEUKPiByZWdpb24gYW5kIG5ldmVy
IHJlbGVhc2VzIGl0LiBBcyB0aGUgbG9vcCBydW5zLCB0aG9zZSByZWdpb25zCj4gYWNjdW11bGF0
ZSBjb25zdW1pbmcgYm90aCB2aXJ0dWFsIGFkZHJlc3Mgc3BhY2UgYW5kIGNvbW1pdHRlZCBwaHlz
aWNhbAo+IG1lbW9yeSByaWdodCBhd2F5IGluc3RlYWQgb2YgbGF6aWx5Lgo+Cj4gRWFzaWx5IG1t
YXAoKSBmYWlscyB3aXRoIEVOT01FTSBvbiBzbWFsbGVyL2xpbWl0IFJBTSByZXNvdXJjZSBzeXN0
ZW0uCj4KPiBFcnJvciBMb2c6Cj4KPiAgIGN2ZS0yMDE3LTE3MDUyLmM6NDg6IFRCUk9LOiBtbWFw
KChuaWwpLDE2Nzc3MjE2LFBST1RfUkVBRCgxKSwzMjgwMiwtMSwwKSBmYWlsZWQ6IEVOT01FTSAo
MTIpCj4gICB0c3RfdGVzdC5jOjQ3OTogVElORk86IENoaWxkIHByb2Nlc3MgcmVwb3J0ZWQgVEJS
T0sga2lsbGluZyB0aGUgdGVzdAo+ICAgdHN0X3Rlc3QuYzoxOTA5OiBUSU5GTzogS2lsbGVkIHRo
ZSBsZWZ0b3ZlciBkZXNjZW5kYW50IHByb2Nlc3Nlcwo+Cj4gQ29uc2lkZXIgdGhlcmUgaXMgbm8g
cHJhY3RpY2FsIHVwcGVyIGJvdW5kIG9uIHRoaXMgYWxsb2NhdGlvbiBwYXR0ZXJuLAo+IHNvIHNl
dHRpbmcgLnRlc3QubWluX21lbV9hdmFpbCBtYXkgbm90IGhlbHBzLiBIZXJlIHdlIGp1c3QgdG9s
ZXJhdGUKPiBFTk9NRU0gZHVyaW5nIHRoZSBtbWFwX3RocmVhZCgpIGxvb3BpbmcuCj4KPiBTaWdu
ZWQtb2ZmLWJ5OiBMaSBXYW5nIDxsaXdhbmdAcmVkaGF0LmNvbT4KPiAtLS0KPiAgdGVzdGNhc2Vz
L2N2ZS9jdmUtMjAxNy0xNzA1Mi5jIHwgOSArKysrKysrKy0KPiAgMSBmaWxlIGNoYW5nZWQsIDgg
aW5zZXJ0aW9ucygrKSwgMSBkZWxldGlvbigtKQo+Cj4gZGlmZiAtLWdpdCBhL3Rlc3RjYXNlcy9j
dmUvY3ZlLTIwMTctMTcwNTIuYyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTIuYwo+IGlu
ZGV4IDcwMGViNzgyZS4uNjEwMzJjMTk3IDEwMDY0NAo+IC0tLSBhL3Rlc3RjYXNlcy9jdmUvY3Zl
LTIwMTctMTcwNTIuYwo+ICsrKyBiL3Rlc3RjYXNlcy9jdmUvY3ZlLTIwMTctMTcwNTIuYwo+IEBA
IC00NCw5ICs0NCwxNiBAQCBzdGF0aWMgdm9pZCBjbGVhbnVwKHZvaWQpCj4KPiAgc3RhdGljIHZv
aWQgKm1tYXBfdGhyZWFkKHZvaWQgKmFyZykKPiAgewo+ICsgICAgICAgdm9pZCAqcHRyOwo+ICsK
PiAgICAgICAgIGZvciAoOzspIHsKPiAtICAgICAgICAgICAgICAgU0FGRV9NTUFQKE5VTEwsIDB4
MTAwMDAwMCwgUFJPVF9SRUFELAo+ICsgICAgICAgICAgICAgICBwdHIgPSBtbWFwKE5VTEwsIDB4
MTAwMDAwMCwgUFJPVF9SRUFELAo+ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgTUFQ
X1BPUFVMQVRFfE1BUF9BTk9OWU1PVVN8TUFQX1BSSVZBVEUsIC0xLCAwKTsKPiArCj4gKyAgICAg
ICAgICAgICAgIGlmICgocHRyID09IE1BUF9GQUlMRUQpICYmIChlcnJubyA9PSBFTk9NRU0pKSB7
Cj4gKyAgICAgICAgICAgICAgICAgICAgICAgdXNsZWVwKDEwMDApOwo+ICsgICAgICAgICAgICAg
ICAgICAgICAgIGNvbnRpbnVlOwo+ICsgICAgICAgICAgICAgICB9CgpPb3BzLCBJIGZvcmdvdCB0
byBoYW5kbGUgdGhlIG90aGVyIGZhaWx1cmVzLCBzbyB0aGUgcGF0Y2ggc2hvdWxkIGJlOgoKLS0t
IGEvdGVzdGNhc2VzL2N2ZS9jdmUtMjAxNy0xNzA1Mi5jCisrKyBiL3Rlc3RjYXNlcy9jdmUvY3Zl
LTIwMTctMTcwNTIuYwpAQCAtNDQsOSArNDQsMTkgQEAgc3RhdGljIHZvaWQgY2xlYW51cCh2b2lk
KQoKIHN0YXRpYyB2b2lkICptbWFwX3RocmVhZCh2b2lkICphcmcpCiB7CisgICAgICAgdm9pZCAq
cHRyOworCiAgICAgICAgZm9yICg7OykgewotICAgICAgICAgICAgICAgU0FGRV9NTUFQKE5VTEws
IDB4MTAwMDAwMCwgUFJPVF9SRUFELAorICAgICAgICAgICAgICAgcHRyID0gbW1hcChOVUxMLCAw
eDEwMDAwMDAsIFBST1RfUkVBRCwKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBNQVBf
UE9QVUxBVEV8TUFQX0FOT05ZTU9VU3xNQVBfUFJJVkFURSwgLTEsIDApOworCisgICAgICAgICAg
ICAgICBpZiAocHRyID09IE1BUF9GQUlMRUQpIHsKKyAgICAgICAgICAgICAgICAgICAgICAgaWYg
KGVycm5vID09IEVOT01FTSkgeworICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHVzbGVl
cCgxMDAwKTsKKyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICBjb250aW51ZTsKKyAgICAg
ICAgICAgICAgICAgICAgICAgfQorICAgICAgICAgICAgICAgICAgICAgICB0c3RfYnJrKFRCUk9L
IHwgVFRFUlJOTywgIlVuZXhwZWN0ZWQgbW1hcCgpIGVycm9yIik7CisgICAgICAgICAgICAgICB9
CiAgICAgICAgfQoKICAgICAgICByZXR1cm4gYXJnOwoKCgotLSAKUmVnYXJkcywKTGkgV2FuZwoK
Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK
