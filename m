Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 7DF76880C56
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Mar 2024 08:48:26 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 42C0A3CE65A
	for <lists+linux-ltp@lfdr.de>; Wed, 20 Mar 2024 08:48:26 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 3344B3CB5E1
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 08:48:20 +0100 (CET)
Authentication-Results: in-3.smtp.seeweb.it; spf=pass (sender SPF authorized)
 smtp.mailfrom=redhat.com (client-ip=170.10.129.124;
 helo=us-smtp-delivery-124.mimecast.com; envelope-from=liwan@redhat.com;
 receiver=lists.linux.it)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 722F71A010F3
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 08:48:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1710920898;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=YMPBwyq1iFPx4mCaPCzAentkO5R/Eup25mvNa0X/YDk=;
 b=UBEySBs8xbrHmJ3Aw+UgPEYA+WoVUPP7TvChwpu1CqG89V2NZBu0iLBxcqRk671G0X9SmS
 pi4tJkSg7DSGGbS8mQNNc26uds4kuaA/eI4HuN9JoMAyhWLFEoALNwaBQmFiZixsdaOAau
 tOFyy3aF0Gm9IpspdCENBOyjZQwRuwI=
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-479-Iu3za_KrMZaAYhbPfLKvxg-1; Wed, 20 Mar 2024 03:48:14 -0400
X-MC-Unique: Iu3za_KrMZaAYhbPfLKvxg-1
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-29e06733018so3388500a91.0
 for <ltp@lists.linux.it>; Wed, 20 Mar 2024 00:48:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710920893; x=1711525693;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YMPBwyq1iFPx4mCaPCzAentkO5R/Eup25mvNa0X/YDk=;
 b=BoNjdzPJeVChGFpPoLZhsyxir/436LedCpJjBy9iNx+wcZH4Znzqz+SsqLTBYxGub6
 iahsQrPiV1Cs03ytiKlTjE0syeyi2CKgOosvS9fmFBZn0hR0ImiTSWJhNgbRTTKi8Exr
 uERYV70cL6CRb81rXs+/dycYr3YOUYTyTzwYefbM/gC3Gtf3010Zh1ED/DJpCv6Xfox7
 yjqtFcmIPYncMOkBIU5ha/s+fKoFvWdXiw29T7qL+O6oC1nWuuQdkQgdFAejsyTek1+U
 x58eB1YRCX8kuk+AT8inoGSoZ8lqw94hNoc4tt1ddXgfl2wEhg+CQIuRoaoIQlc6Tpi/
 OK4A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtx8yA8tJ53H2H0x4jIpxHy1Ud+qrR9HkhCbxXf9YvlbW9mvkbGxu6f3OQcta9syT7VEUWG5U32GtGPQHmQG26O+M=
X-Gm-Message-State: AOJu0Yz+WD2DBUBPcOrrpJqCuJ3umuZGWcIEhQ4o0TKVMb4uOGmyGRb7
 xwx4pR8AGk/A/3f2hu7BYnZGrCTCOgktDaFh5ZXF9QUnId64RmZRrMGJxbBQ5JqQzhuu1FvTid3
 OYHWaIM5vfMHuZlgdhl/wnWw3ly4qj3HsSJ5gnup860ne/79b/i8RatFsMWAyYV9qaORVkbyHTP
 xgeVRyKaqL5r7CjfK89fAShmw=
X-Received: by 2002:a17:90b:46c5:b0:29c:761e:3955 with SMTP id
 jx5-20020a17090b46c500b0029c761e3955mr1195656pjb.17.1710920893604; 
 Wed, 20 Mar 2024 00:48:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH2wSi9xyO3mAleOtFHpabpk3ifuOaeyas3JgT+E7poHa5OqbEyHfValYQtI12gOjrKALIg2L/jdcDXdjN3Uhs=
X-Received: by 2002:a17:90b:46c5:b0:29c:761e:3955 with SMTP id
 jx5-20020a17090b46c500b0029c761e3955mr1195648pjb.17.1710920893284; Wed, 20
 Mar 2024 00:48:13 -0700 (PDT)
MIME-Version: 1.0
References: <6868ae95-b004-4fb2-8aac-7ccf96b32f90@suse.com>
 <CAEemH2eDT6gN3hw=Lz2qgnwFnnHmNYai9tqbKduSkcWfNjpERQ@mail.gmail.com>
 <Zfmj28EpMH_S0uOo@yuki>
 <CAEemH2ci5r_PKq_tOSrFC4Vk9ju3xnrGzZ=smOT+8PGBXtWCGg@mail.gmail.com>
 <c8d89dba-84e1-4daa-9d98-78bf10b4e0e4@suse.com>
In-Reply-To: <c8d89dba-84e1-4daa-9d98-78bf10b4e0e4@suse.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 20 Mar 2024 15:48:00 +0800
Message-ID: <CAEemH2ddq=fVhkF1aJoBt5PMSS--My_zONYjBE__4jppZ3bOAQ@mail.gmail.com>
To: Andrea Cervesato <andrea.cervesato@suse.com>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-3.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.3 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] New LTP documentation!
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gV2VkLCBNYXIgMjAsIDIwMjQgYXQgMzo0NeKAr1BNIEFuZHJlYSBDZXJ2ZXNhdG8gPGFuZHJl
YS5jZXJ2ZXNhdG9Ac3VzZS5jb20+Cndyb3RlOgoKPiBIaSBMaSwKPgo+IE9uIDMvMjAvMjQgMDM6
NTIsIExpIFdhbmcgd3JvdGU6Cj4KPgo+Cj4gT24gVHVlLCBNYXIgMTksIDIwMjQgYXQgMTA6NDHi
gK9QTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3VzZS5jej4gd3JvdGU6Cj4KPj4gSGkhCj4+ID4g
QW5kIEkganVzdCB0cmllZCB0aGF0IHRoZSBsYXRlc3QgTFRQIGNvbXBpbGVkICYgZXhlY3V0ZWQg
c3VjY2VlZCBvbgo+PiA+IFJIRUwtNy45Lgo+PiA+IENhbiB5b3UgdXBkYXRlIHRoZSAiT2xkZXN0
IHRlc3RlZCBkaXN0cmlidXRpb25zIiBbMV0gcGFydCBieSBhZGRpbmc6Cj4+ID4KPj4gPiAgIFJI
RUwtNy45IE1haXBvIChEaXN0cm8pICAzLjEwIChrZXJuZWwpICA0LjguNShnY2MpICAyLjE3KGds
aWJjKQo+PiAtKGNsYW5nKQo+Pgo+PiBTdXJlIHdlIGNhbiBhZGQgdGhpcywgaG93ZXZlciB5b3Ug
d2lsbCBiZSByZXNwb25zaWJsZSBmb3IgbWFraW5nIHN1cmUgaXQKPj4gd29ya3MgYW5kIGF0IGxl
YXN0IGRvIHByZS1yZWxlYXNlIHRlc3RpbmcuCj4+Cj4KPiBZZXMsIG9mIGNvdXJzZS4gVGhhbmtz
IGZvciByZW1pbmRpbmcgbWUuCj4KPiBJZiBpdCdzIE9rIGZvciB5b3UsIEkgd2lsbCBhZGQgUkhF
TCB0byB0aGUgIk9sZGVzdCB0ZXN0ZWQgZGlzdHJpYnV0aW9uIgo+IGNoYXB0ZXIgYXMgc3VnZ2Vz
dGVkLgo+CgpZZXMsIHBsZWFzZS4gSSBkbyB0aGF0IHByZS1yZWxlYXNlIHRlc3RpbmcgZm9yIGVh
Y2ggc2Vhc29uLgoKVGhhbmsgeW91fgoKLS0gClJlZ2FyZHMsCkxpIFdhbmcKCi0tIApNYWlsaW5n
IGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
