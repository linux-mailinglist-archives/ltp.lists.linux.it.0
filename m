Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 943728B376E
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 14:48:18 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 569403D0387
	for <lists+linux-ltp@lfdr.de>; Fri, 26 Apr 2024 14:48:18 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 0BF0B3D0323
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 14:48:09 +0200 (CEST)
Authentication-Results: in-2.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=jstancek@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 7D6A46024FB
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 14:48:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1714135686;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 content-transfer-encoding:content-transfer-encoding:
 in-reply-to:in-reply-to:references:references;
 bh=wCxbpcq9+v1fWien6lCfaibh2b1IqEh7dzG9YfXHnMU=;
 b=SvIiiGo9unyRd/ZNK3k7FoiU/WiNWRVb+tc6xa1YpniPX/n2S5SlavYO+cbAcTxzLDqpOU
 IIDO2bS7SCWFq4f7omICsYKYGOcCT8cuLzEolJ+tsPSC+qNqTvBFJWg74AB+jFMz/Mb0ZQ
 0CHtyVHpBn6nmkPCTYNL0u/dkJ/K6J8=
Received: from mail-oo1-f72.google.com (mail-oo1-f72.google.com
 [209.85.161.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-647-UwItYekSOh2n7x2ZYduBwg-1; Fri, 26 Apr 2024 08:48:05 -0400
X-MC-Unique: UwItYekSOh2n7x2ZYduBwg-1
Received: by mail-oo1-f72.google.com with SMTP id
 006d021491bc7-5ac4470de2eso2125534eaf.1
 for <ltp@lists.linux.it>; Fri, 26 Apr 2024 05:48:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714135684; x=1714740484;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wCxbpcq9+v1fWien6lCfaibh2b1IqEh7dzG9YfXHnMU=;
 b=nU48Qcsh3E8r/pelE71jDYmxPcD2IOb2Fol+yoAvf0eiZWmxp8uiPysl5gEnYyoMsq
 XrV86zfjNy8YKCen9BjFs4HDHeIud0LKAESq9kxH/I7bWuIjBOa3Aub+KJD+rFO2l30t
 06c7U+D0HRWqcnCpl8DYtUGZpcJ9AvXt5HtHAy7F0xhUEad+gH/+gcIeSx6FhuEEBftD
 npPtJx6rNQSEv86/s4mx/hF3O5pPMf9DGVeo363Erp971RYwAWJM0SisvlrVJuXhr4sn
 rRB7fqpUeD6jerYR1BKt1fs16TtgQ2kMAcUWxCf85IkCuueHNvklSytyeg+4WbeklZMe
 nb3Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCXMXjaVjefg+yLhs1yVDBPx29n1SVFlBs9dbw4KwhOJfPCqdHeufyVjo4E4HFJIBW8H7x8gokfLzV0cOA6Bsy9L7dg=
X-Gm-Message-State: AOJu0YxIIAeQlFTQ7N5GYZOLA5Tn5//BbLa8yjU5cYmG+drqgqUn+cgT
 VgH7yROd43fUxQnJyoIBODv/islcyYz82XlOR+GoDkvIoQFdhQ7dqbPTCKoGdkGyUcxgkK/d5NB
 vhiAc85HcNLyJEoXEy0sFNwUy0VhzGhlKPlfYxCFefbexo5YMAqjr6plid/rRTURBexbMAyU5Z5
 1DC1U+nH0kxP/grlNzepsmP1A=
X-Received: by 2002:a4a:98f3:0:b0:5ac:9e85:832f with SMTP id
 b48-20020a4a98f3000000b005ac9e85832fmr3117352ooj.5.1714135684235; 
 Fri, 26 Apr 2024 05:48:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHBQjvVi1jxhEcNSGnufFb4nQibQmWOpCjSDDLYHp4M1aPMmqKp1B2NIP/719Sp03+q/NZlp/l/ZAphz+chsDs=
X-Received: by 2002:a4a:98f3:0:b0:5ac:9e85:832f with SMTP id
 b48-20020a4a98f3000000b005ac9e85832fmr3117334ooj.5.1714135683862; Fri, 26 Apr
 2024 05:48:03 -0700 (PDT)
MIME-Version: 1.0
References: <20240419070717.2506101-1-lufei@uniontech.com>
 <20240421071539.2547355-1-lufei@uniontech.com>
 <Zitniv9NFio-HOGo@yuki> <tencent_42AB1A7801A243DA5A5D51C0@qq.com>
 <ZiuB6-9qKfhXrRzg@yuki> <tencent_009ECE842B1AB962044FA740@qq.com>
In-Reply-To: <tencent_009ECE842B1AB962044FA740@qq.com>
From: Jan Stancek <jstancek@redhat.com>
Date: Fri, 26 Apr 2024 14:47:47 +0200
Message-ID: <CAASaF6xnL6VA2VJAaZ1nPFdvY4=ZvXn+aS0r5C=DZ4QYiz-C6w@mail.gmail.com>
To: =?UTF-8?B?6Lev5paQ?= <lufei@uniontech.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,DMARC_PASS,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-2.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] (no subject)
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
Cc: ltp <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gRnJpLCBBcHIgMjYsIDIwMjQgYXQgMjoyN+KAr1BNIOi3r+aWkCA8bHVmZWlAdW5pb250ZWNo
LmNvbT4gd3JvdGU6Cj4KPiBIaSwgQ3lyaWwuCj4gSGVyZSBpcyBteSBjYXNlOgo+Cj4KPiBgYGAK
PiBbcm9vdEByb2NreSBhcmNoX3ByY3RsXSMgZ2NjIC0tdmVyc2lvbgo+IGdjYyAoR0NDKSAxMS40
LjEgMjAyMzA2MDUgKFJlZCBIYXQgMTEuNC4xLTIpCj4gQ29weXJpZ2h0IChDKSAyMDIxIEZyZWUg
U29mdHdhcmUgRm91bmRhdGlvbiwgSW5jLgo+IFRoaXMgaXMgZnJlZSBzb2Z0d2FyZTsgc2VlIHRo
ZSBzb3VyY2UgZm9yIGNvcHlpbmcgY29uZGl0aW9ucy4mbmJzcDsgVGhlcmUgaXMgTk8KPiB3YXJy
YW50eTsgbm90IGV2ZW4gZm9yIE1FUkNIQU5UQUJJTElUWSBvciBGSVRORVNTIEZPUiBBIFBBUlRJ
Q1VMQVIgUFVSUE9TRS4KPgo+IFtyb290QHJvY2t5IGFyY2hfcHJjdGxdIyB1bmFtZSAtYQo+IExp
bnV4IHJvY2t5IDUuMTQuMC0zNjIuMTguMS5lbDlfMy4wLjEueDg2XzY0ICMxIFNNUCBQUkVFTVBU
X0RZTkFNSUMgU3VuIEZlYiAxMSAxMzo0OToyMyBVVEMgMjAyNCB4ODZfNjQgeDg2XzY0IHg4Nl82
NCBHTlUvTGludXgKPgo+IFtyb290QHJvY2t5IGFyY2hfcHJjdGxdIyBjYXQgYXJjaF9wcmN0bDAx
LmMmbmJzcDsKPiAvLyBTUERYLUxpY2Vuc2UtSWRlbnRpZmllcjogR1BMLTIuMC1vci1sYXRlcgo+
IC8qCj4gJm5ic3A7KiBDb3B5cmlnaHQgKGMpIFVuaW9uVGVjaCBTb2Z0d2FyZSBUZWNobm9sb2d5
IENvLixMdGQuLCAyMDI0Cj4gJm5ic3A7KiBBdXRob3I6IEx1IEZlaSA8bHVmZWlAdW5pb250ZWNo
LmNvbSZndDsKPiAmbmJzcDsqLwo+Cj4KPiAvKlwKPiAmbmJzcDsqIFtEZXNjcmlwdGlvbl0KPiAm
bmJzcDsqCj4gJm5ic3A7KiBTaW1wbGUgdGVzdCBvbiBhcmNoX3ByY3RsIHRvIHNldCBhbmQgZ2V0
IGNwdWlkIGluc3RydWN0aW9uIG9mIHRlc3QgdGhyZWFkLgo+ICZuYnNwOyovCj4KPgo+ICNpbmNs
dWRlICJ0c3RfdGVzdC5oIgo+ICNpbmNsdWRlICJsYXBpL3N5c2NhbGxzLmgiCj4gI2luY2x1ZGUg
PHN0ZGxpYi5oJmd0Owo+ICNpZmRlZiBIQVZFX0FTTV9QUkNUTF9ICj4gI2luY2x1ZGUgPGFzbS9w
cmN0bC5oJmd0Owo+Cj4KPiBzdGF0aWMgaW50IGFyY2hfcHJjdGxfZ2V0KGludCBjb2RlLCB1bnNp
Z25lZCBsb25nICphZGRyKQo+IHsKPiAgICAgICAgIHJldHVybiB0c3Rfc3lzY2FsbChfX05SX2Fy
Y2hfcHJjdGwsIGNvZGUsICphZGRyKTsKICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgICBeXgp5b3UgYXJlIGRlLXJlZmVuY2luZyBoZXJlLCB3aGlsZSBrZXJuZWwgZXhw
ZWN0cyBhIHBvaW50ZXIKCj4gfQo+Cj4KPiBzdGF0aWMgaW50IGFyY2hfcHJjdGxfc2V0KGludCBj
b2RlLCB1bnNpZ25lZCBsb25nIGFkZHIpCj4gewo+ICAgICAgICAgcmV0dXJuIHRzdF9zeXNjYWxs
KF9fTlJfYXJjaF9wcmN0bCwgY29kZSwgYWRkcik7Cj4gfQo+Cj4KPiBzdGF0aWMgdm9pZCBydW4o
dW5zaWduZWQgaW50IGluZGV4KQo+IHsKPiAgICAgICAgIHVuc2lnbmVkIGxvbmcgKmFkZHIgPSBt
YWxsb2Moc2l6ZW9mKGxvbmcpKTsKPgo+Cj4gICAgICAgICAvLyBpbmRleCA9PSAwIGZvciBkaXNh
YmxlIGNwdWlkLCAxIGZvciBlbmFibGUgY3B1aWQuCj4gICAgICAgICBUU1RfRVhQX1BBU1MoYXJj
aF9wcmN0bF9zZXQoQVJDSF9TRVRfQ1BVSUQsIGluZGV4KSk7Cj4KPgo+ICAgICAgICAgVEVTVChh
cmNoX3ByY3RsX2dldChBUkNIX0dFVF9DUFVJRCwgYWRkcikpOwo+Cj4KPiAgICAgICAgIGlmIChU
U1RfUkVUID09IGluZGV4KQo+ICAgICAgICAgICAgICAgICB0c3RfcmVzKFRQQVNTLCAiZ2V0IGNw
dWlkIHN1Y2NlZWQuIik7Cj4gICAgICAgICBlbHNlCj4gICAgICAgICAgICAgICAgIHRzdF9yZXMo
VEZBSUwsICJnZXQgY3B1aWQgZmFpbGVkLiIpOwo+IH0KPgo+Cj4gc3RhdGljIHN0cnVjdCB0c3Rf
dGVzdCB0ZXN0ID0gewo+ICAgICAgICAgLnRlc3QgPSBydW4sCj4gICAgICAgICAudGNudCA9IDIs
Cj4gICAgICAgICAubWluX2t2ZXIgPSAiNC4xMiIsCj4gICAgICAgICAuc3VwcG9ydGVkX2FyY2hz
ID0geyJ4ODZfNjQiLCAieDg2IiwgTlVMTH0sCj4gfTsKPgo+Cj4gI2Vsc2UgLyogSEFWRV9BU01f
UFJDVExfSCAqLwo+IFRTVF9URVNUX1RDT05GKCJtaXNzaW5nIDxhc20vcHJjdGwuaCZndDsiKTsK
PiAjZW5kaWYKPiBbcm9vdEByb2NreSBhcmNoX3ByY3RsXSMgbWFrZSBjbGVhbgo+IHJtIC1mIC1m
IC1yIGFyY2hfcHJjdGwwMSZuYnNwOyAqLm8gKi5weWMgLmNhY2hlLm1rICouZHdvIC4qLmR3bwo+
IFtyb290QHJvY2t5IGFyY2hfcHJjdGxdIyBtYWtlIGNoZWNrCj4gQ0hFQ0sgdGVzdGNhc2VzL2tl
cm5lbC9zeXNjYWxscy9hcmNoX3ByY3RsL2FyY2hfcHJjdGwwMS5jCj4gYXJjaF9wcmN0bDAxLmM6
NDg6MTA6IHdhcm5pbmc6IGJvZ3VzIHNjYWxhciBpbml0aWFsaXplcgo+IFtyb290QHJvY2t5IGFy
Y2hfcHJjdGxdIyBtYWtlCj4gbWFrZSAtQyAiL3Jvb3QvRGV2ZWxvcC9sdHAvbGliIiAtZiAiL3Jv
b3QvRGV2ZWxvcC9sdHAvbGliL01ha2VmaWxlIiBhbGwKPiBtYWtlWzFdOiBFbnRlcmluZyBkaXJl
Y3RvcnkgJy9yb290L0RldmVsb3AvbHRwL2xpYicKPiBHRU4gbHRwLXZlcnNpb24uaAo+IG1ha2Vb
Ml06IE5vdGhpbmcgdG8gYmUgZG9uZSBmb3IgJ2FsbCcuCj4gbWFrZVsyXTogTm90aGluZyB0byBi
ZSBkb25lIGZvciAnYWxsJy4KPiBtYWtlWzFdOiBMZWF2aW5nIGRpcmVjdG9yeSAnL3Jvb3QvRGV2
ZWxvcC9sdHAvbGliJwo+IGFyY2hfcHJjdGwwMS5jOjQ4Ojk6IHdhcm5pbmc6IGJyYWNlcyBhcm91
bmQgc2NhbGFyIGluaXRpYWxpemVyCj4gJm5ic3A7ICZuYnNwOzQ4IHwmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDsgJm5ic3A7LnN1cHBvcnRlZF9hcmNocyA9IHsieDg2XzY0IiwgIng4NiIsIE5V
TEx9LAo+ICZuYnNwOyAmbmJzcDsgJm5ic3A7IHwmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7Xgo+IGFyY2hfcHJjdGwwMS5jOjQ4Ojk6IG5vdGU6IChuZWFyIGluaXRpYWxpemF0aW9u
IGZvciDigJh0ZXN0LnN1cHBvcnRlZF9hcmNoc+KAmSkKPiBhcmNoX3ByY3RsMDEuYzo0ODoyOTog
d2FybmluZzogaW5pdGlhbGl6YXRpb24gb2Yg4oCYY29uc3QgY2hhciAqIGNvbnN0KuKAmSBmcm9t
IGluY29tcGF0aWJsZSBwb2ludGVyIHR5cGUg4oCYY2hhciAq4oCZIFstV2luY29tcGF0aWJsZS1w
b2ludGVyLXR5cGVzXQo+ICZuYnNwOyAmbmJzcDs0OCB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5i
c3A7ICZuYnNwOy5zdXBwb3J0ZWRfYXJjaHMgPSB7Ing4Nl82NCIsICJ4ODYiLCBOVUxMfSwKPiAm
bmJzcDsgJm5ic3A7ICZuYnNwOyB8Jm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAm
bmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZu
YnNwOyAmbmJzcDtefn5+fn5+fgo+IGFyY2hfcHJjdGwwMS5jOjQ4OjI5OiBub3RlOiAobmVhciBp
bml0aWFsaXphdGlvbiBmb3Ig4oCYdGVzdC5zdXBwb3J0ZWRfYXJjaHPigJkpCj4gYXJjaF9wcmN0
bDAxLmM6NDg6Mzk6IHdhcm5pbmc6IGV4Y2VzcyBlbGVtZW50cyBpbiBzY2FsYXIgaW5pdGlhbGl6
ZXIKPiAmbmJzcDsgJm5ic3A7NDggfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsu
c3VwcG9ydGVkX2FyY2hzID0geyJ4ODZfNjQiLCAieDg2IiwgTlVMTH0sCj4gJm5ic3A7ICZuYnNw
OyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDtefn5+fgo+IGFyY2hfcHJjdGwwMS5j
OjQ4OjM5OiBub3RlOiAobmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYdGVzdC5zdXBwb3J0ZWRf
YXJjaHPigJkpCj4gYXJjaF9wcmN0bDAxLmM6NDg6NDY6IHdhcm5pbmc6IGV4Y2VzcyBlbGVtZW50
cyBpbiBzY2FsYXIgaW5pdGlhbGl6ZXIKPiAmbmJzcDsgJm5ic3A7NDggfCZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsuc3VwcG9ydGVkX2FyY2hzID0geyJ4ODZfNjQiLCAieDg2Iiwg
TlVMTH0sCj4gJm5ic3A7ICZuYnNwOyAmbmJzcDsgfCZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNw
OyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7
ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsgJm5ic3A7ICZuYnNwOyAmbmJzcDsg
Jm5ic3A7ICZuYnNwOyAmbmJzcDsgXn5+fgo+IGFyY2hfcHJjdGwwMS5jOjQ4OjQ2OiBub3RlOiAo
bmVhciBpbml0aWFsaXphdGlvbiBmb3Ig4oCYdGVzdC5zdXBwb3J0ZWRfYXJjaHPigJkpCj4gQ0Mg
dGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9hcmNoX3ByY3RsL2FyY2hfcHJjdGwwMQo+IGBgYAo+
Cj4KPgo+Cj4KPgo+Cj4gIOi3r+aWkCBGZWkuTHUKPiBVbmlvbnRlY2ggVGVjaG5vbG9neQo+IHNp
dGU6IHd3dy51bmlvbnRlY2guY29tCj4gdGVsOiAxODUwMTAxMjM1Mgo+IGFkZHI6IFhpJ2FuIENo
aW5hCj4KPgo+Cj4KPgo+ICZuYnNwOwo+ICZuYnNwOwo+ICZuYnNwOwo+IC0tLS0tLS0tLS0tLS0t
LS0tLSZuYnNwO09yaWdpbmFsJm5ic3A7LS0tLS0tLS0tLS0tLS0tLS0tCj4gRnJvbTogJm5ic3A7
IkN5cmlsJm5ic3A7SHJ1YmlzIjxjaHJ1YmlzQHN1c2UuY3omZ3Q7Owo+IERhdGU6ICZuYnNwO0Zy
aSwgQXByIDI2LCAyMDI0IDA2OjMwIFBNCj4gVG86ICZuYnNwOyLot6/mlpAiPGx1ZmVpQHVuaW9u
dGVjaC5jb20mZ3Q7Owo+IENjOiAmbmJzcDsibHRwIjxsdHBAbGlzdHMubGludXguaXQmZ3Q7Owo+
IFN1YmplY3Q6ICZuYnNwO1JlOiBSZToKPgo+ICZuYnNwOwo+Cj4gSGkhCj4gJmd0OyBJIHRyaWVk
IHVzaW5nIE5VTEwsIGJ1dCBtZXQgYFRCUk9LOiBUZXN0IGtpbGxlZCBieSBTSUdTRUdWIWAuJmFt
cDtuYnNwOwo+Cj4gVGhhdCBtZWFucyB0aGF0IHRoZSBtYW51YWwgcGFnZSBpcyB3cm9uZyBhbmQg
dGhlIGFkZHJlc3MgaXMgbm90IGlnbm9yZWQuCj4KPiAmZ3Q7IEFuZCB0aGUgbGFzdCB0aW1lIHlv
dSBtZW50aW9uZWQgaW4gcmVzcG9uc2UgdG8gdXNpbmcKPiAmZ3Q7IGBzdXBwb3J0ZWRfYXJjaHNg
LCB0aGlzIHNlZW1zIG5vdCB3b3JrIHByb3Blcmx5IGJ5IG5vdywgdGhlIGx0cAo+ICZndDsgZG9j
dW1lbnQoc2VjdGlvbiBvZiB3cml0aW5nX3Rlc3RzKSBzYXlzICJub3QgYXBwbGljYWJsZSIuCj4K
PiBUaGUgc3VwcG9ydGVkX2FyY2hzIGlzIHN1cHBvc2VkIHRvIHdvcmsuIEhvdyBkaWQgeW91IHNl
dCBpdCAodGhlIHZhbHVlKQo+IGFuZCB3aGF0IGhhcHBlbmVkPwo+Cj4gLS0KPiBDeXJpbCBIcnVi
aXMKPiBjaHJ1YmlzQHN1c2UuY3oKPgo+IC0tCj4gTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8v
bGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCgoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
