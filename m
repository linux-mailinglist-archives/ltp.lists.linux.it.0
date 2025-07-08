Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C2ED4AFCB77
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 15:10:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lists.linux.it;
 i=@lists.linux.it; q=dns/txt; s=picard; t=1751980226; h=mime-version :
 references : in-reply-to : date : message-id : to : subject : list-id
 : list-unsubscribe : list-archive : list-post : list-help :
 list-subscribe : from : reply-to : cc : content-type :
 content-transfer-encoding : sender : from;
 bh=PYBTBu131s6QpV47UCrYBuH9y76wBtsQcJAddz7raIo=;
 b=hKKnY3XJSQWcilnbcqInfyt+h48l07XAlTmINeNdt5XEpjnko1vJcfaUNYEowfvoD5wPw
 hFQXOJWyw8APoOosJV9tTA+9Dam2vq2tOh2kYPt8ztgl6ZvTVrATc/FWTgyyrZzoYQZCYaz
 3OCyvI2DwBicKuYNHpfDvof+mingFm8=
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 706533CA379
	for <lists+linux-ltp@lfdr.de>; Tue,  8 Jul 2025 15:10:26 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (secp384r1))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id 1ADFF3CA27C
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 15:10:25 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [170.10.129.124])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 125EB1000780
 for <ltp@lists.linux.it>; Tue,  8 Jul 2025 15:10:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1751980222;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=rqe9SAOtjStu0oslCOtu2pRdY7S+N/y2jTvJdUIbXHc=;
 b=Y0HtE4lLaqh9MfhAkeLoitjkZ9sCXy/nFZryIjcXM2Ao7xP3EW2U3VKXNjxJLrL1Rvhaeg
 hxQJBNRp1UUA/4cKnwRAMMO5D25qwSvwfDLcDIZLu4qBvxEga24WQSEtDRO4UtjXAE8XDi
 9hUxYZGH46f3W4xs5unpM7EbNgGmeCQ=
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-5GE-k2TWP3WeH-G8CrJWlA-1; Tue, 08 Jul 2025 09:10:20 -0400
X-MC-Unique: 5GE-k2TWP3WeH-G8CrJWlA-1
X-Mimecast-MFC-AGG-ID: 5GE-k2TWP3WeH-G8CrJWlA_1751980219
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so5150494a12.3
 for <ltp@lists.linux.it>; Tue, 08 Jul 2025 06:10:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751980218; x=1752585018;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rqe9SAOtjStu0oslCOtu2pRdY7S+N/y2jTvJdUIbXHc=;
 b=p8HLS9L7BOQBhA2nsPOC8YbaOHrRct6Oc3d9EfPolqsErDGr7rcddi+RgzNm4AaHnx
 pneDQ+jyJ6rMUE1WPx2vOdf0EzE7cNznl2rXFAqpVx+OG6VX/dwstYyAbeuvVJPSEt1t
 EmQt6WKk4l2/ewZpVnr+icKKhp9iXe2hszTqkMo6PR/4LWpe9HOytTRccCAfvOaesMQh
 EeLv6wPr8KpX2rdLK4fAOwNXC95LrTw6BuHBkmmd6OmsLKcJVSGYgilveHQp+wc5m2YO
 gvedDeZ+O7t3gS3tKz9CtYkoko/w5Qnj+WYjkWfsRaPvwPQcN54Y6IbacWC/TBRsO6mF
 mMRw==
X-Gm-Message-State: AOJu0Yyzx7S2ibgR1l00OWBz7Sx18Vgz+phsxDV70FbcCkhzHi8PpV2w
 +fIuK0DFnPP3MLahnkmrcqKm5WzPX87QyL6b1Ug9HDzuwusFPAxzIFgw++buTIxd9K435/12v2Z
 BwMU7Z5ns+s24Tqr02uvpj/zU24J567zMJPWrtt183SUyVFh42yibuG2B8rG7KVDgEeGgLxONME
 rZcH69HjHP1trncgRMyApFcXPoJHtwWDUwTCVWUQ==
X-Gm-Gg: ASbGnctX3NvBltJQ+hi4blCq45X49uU/enXoyhePtG4kyXQczCji60nnrwRiIVhv2Sr
 iVbBTQjZFdI6paLVPgTWHSeal7H1MT0DUuk8awIr423aqXq3euQ++uyn8PZzDVzjBDrjJdhPz0X
 siU9hO
X-Received: by 2002:a17:90b:5784:b0:31c:260e:55e9 with SMTP id
 98e67ed59e1d1-31c260e565amr2569000a91.24.1751980217532; 
 Tue, 08 Jul 2025 06:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG6j2Ad7H1tcGXOY2mNTd6TMT/MK3V/9PY+heclk+aBukIYZajUwG7eVpnLS7yaV6y0/kjH0T6Ai5PK3YWyb/k=
X-Received: by 2002:a17:90b:5784:b0:31c:260e:55e9 with SMTP id
 98e67ed59e1d1-31c260e565amr2568926a91.24.1751980216605; Tue, 08 Jul 2025
 06:10:16 -0700 (PDT)
MIME-Version: 1.0
References: <20250708112810.3298-1-yangtiezhu@loongson.cn>
In-Reply-To: <20250708112810.3298-1-yangtiezhu@loongson.cn>
Date: Tue, 8 Jul 2025 21:10:03 +0800
X-Gm-Features: Ac12FXyMzDlzgne6eqGZ3v-lgmjy_lzBA_LQ2ZvMD8bfK1a8c_XUohawQ5bnsBA
Message-ID: <CAEemH2ejmvUVrYTgeCM-i=GAZLZ4aDStLWtGKTor2sFKgXq7mQ@mail.gmail.com>
To: Tiezhu Yang <yangtiezhu@loongson.cn>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 5QKggR7VKp03ntEHgoG49ZjwRbvgr5ddf_tvY6sxd5c_1751980219
X-Mimecast-Originator: redhat.com
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 shortcircuit=no autolearn=disabled version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-25) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 1.0.7 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Content-Filtered-By: Mailman/MimeDel 2.1.29
Subject: Re: [LTP] [PATCH v2] getrlimit/getrlimit03: Skip test if
 __NR_getrlimit_ulong not implemented
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

T24gVHVlLCBKdWwgOCwgMjAyNSBhdCA3OjI44oCvUE0gVGllemh1IFlhbmcgPHlhbmd0aWV6aHVA
bG9vbmdzb24uY24+IHdyb3RlOgoKPiBJbiB0aGUgTFRQIGNvZGUsIF9fTlJfZ2V0cmxpbWl0X3Vs
b25nIGlzIGRlZmluZWQgYXMgX19OUl91Z2V0cmxpbWl0Cj4gb3IgX19OUl9nZXRybGltaXQuCj4K
PiBJbiB0aGUgTGludXgga2VybmVsLCBMb29uZ0FyY2ggdXNlcyB0aGUgZ2VuZXJpYyBzeXNjYWxs
IHRhYmxlCj4gd2hpY2ggaXMgZGVmaW5lZCBpbiBpbmNsdWRlL3VhcGkvYXNtLWdlbmVyaWMvdW5p
c3RkLmguIFdlIGNhbgo+IHNlZSB0aGF0IF9fTlJfdWdldHJsaW1pdCBpcyBub3QgZGVmaW5lZCBp
biB0aGUgZ2VuZXJpYyBoZWFkZXIsCj4gYW5kIGFsc28gdGhlcmUgaXMgbm8gX19BUkNIX1dBTlRf
U0VUX0dFVF9STElNSVQgZGVmaW5pdGlvbiBpbgo+IHRoZSBhcmNoIHNwZWNpZmljIGhlYWRlciBh
cmNoL2xvb25nYXJjaC9pbmNsdWRlL2FzbS91bmlzdGQuaCwKPiBzbyBib3RoIF9fTlJfdWdldHJs
aW1pdCBhbmQgX19OUl9nZXRybGltaXQgYXJlIG5vdCBpbXBsZW1lbnRlZAo+IG9uIExvb25nQXJj
aC4KPgo+IFRoYXQgaXMgdG8gc2F5LCBubyBuZWVkIHRvIGNvbXBhcmUgdGhlIHJldHVybiB2YWx1
ZSBhbmQgZXJybm8KPiBhYm91dCB0aGUgc3lzY2FsbCBudW1iZXJzIF9fTlJfcHJsaW1pdDY0IGFu
ZCBfX05SX3t1fWdldHJsaW1pdCwKPiBqdXN0IGNoZWNrIHRoaXMgY2FzZSBhbmQgdGhlbiBza2lw
IHRoZSB0ZXN0Lgo+Cj4gV2hpbGUgYXQgaXQsIG1vZGlmeSB0aGUgdmFsdWUgb2YgdGVzdC50Y250
IGFzIDEgdG8gc2tpcCBvbmx5Cj4gb25jZSBpZiB0aGUgZXJybm8gb2YgZ2V0cmxpbWl0X3Vsb25n
KCkgb3IgZ2V0cmxpbWl0X2xvbmcoKSBpcwo+IEVOT1NZUy4KPgo+IFdpdGhvdXQgdGhpcyBwYXRj
aDoKPgo+ICQgL29wdC9sdHAvdGVzdGNhc2VzL2Jpbi9nZXRybGltaXQwMwo+IC4uLgo+IGdldHJs
aW1pdDAzLmM6MTAyOiBURkFJTDogX19OUl9wcmxpbWl0NjQoMCkgcmV0dXJuZWQgMCAoU1VDQ0VT
UykgYnV0Cj4gX19OUl9nZXRybGltaXQoMCkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGlt
aXQwMy5jOjEwMjogVEZBSUw6IF9fTlJfcHJsaW1pdDY0KDEpIHJldHVybmVkIDAgKFNVQ0NFU1Mp
IGJ1dAo+IF9fTlJfZ2V0cmxpbWl0KDEpIHJldHVybmVkIC0xIChFTk9TWVMpCj4gZ2V0cmxpbWl0
MDMuYzoxMDI6IFRGQUlMOiBfX05SX3BybGltaXQ2NCgyKSByZXR1cm5lZCAwIChTVUNDRVNTKSBi
dXQKPiBfX05SX2dldHJsaW1pdCgyKSByZXR1cm5lZCAtMSAoRU5PU1lTKQo+IGdldHJsaW1pdDAz
LmM6MTAyOiBURkFJTDogX19OUl9wcmxpbWl0NjQoMykgcmV0dXJuZWQgMCAoU1VDQ0VTUykgYnV0
Cj4gX19OUl9nZXRybGltaXQoMykgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5j
OjEwMjogVEZBSUw6IF9fTlJfcHJsaW1pdDY0KDQpIHJldHVybmVkIDAgKFNVQ0NFU1MpIGJ1dAo+
IF9fTlJfZ2V0cmxpbWl0KDQpIHJldHVybmVkIC0xIChFTk9TWVMpCj4gZ2V0cmxpbWl0MDMuYzox
MDI6IFRGQUlMOiBfX05SX3BybGltaXQ2NCg1KSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBf
X05SX2dldHJsaW1pdCg1KSByZXR1cm5lZCAtMSAoRU5PU1lTKQo+IGdldHJsaW1pdDAzLmM6MTAy
OiBURkFJTDogX19OUl9wcmxpbWl0NjQoNikgcmV0dXJuZWQgMCAoU1VDQ0VTUykgYnV0Cj4gX19O
Ul9nZXRybGltaXQoNikgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjog
VEZBSUw6IF9fTlJfcHJsaW1pdDY0KDcpIHJldHVybmVkIDAgKFNVQ0NFU1MpIGJ1dAo+IF9fTlJf
Z2V0cmxpbWl0KDcpIHJldHVybmVkIC0xIChFTk9TWVMpCj4gZ2V0cmxpbWl0MDMuYzoxMDI6IFRG
QUlMOiBfX05SX3BybGltaXQ2NCg4KSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dl
dHJsaW1pdCg4KSByZXR1cm5lZCAtMSAoRU5PU1lTKQo+IGdldHJsaW1pdDAzLmM6MTAyOiBURkFJ
TDogX19OUl9wcmxpbWl0NjQoOSkgcmV0dXJuZWQgMCAoU1VDQ0VTUykgYnV0Cj4gX19OUl9nZXRy
bGltaXQoOSkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDEwKSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxMCkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDExKSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxMSkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDEyKSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxMikgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDEzKSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxMykgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDE0KSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxNCkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPiBnZXRybGltaXQwMy5jOjEwMjogVEZBSUw6
IF9fTlJfcHJsaW1pdDY0KDE1KSByZXR1cm5lZCAwIChTVUNDRVNTKSBidXQKPiBfX05SX2dldHJs
aW1pdCgxNSkgcmV0dXJuZWQgLTEgKEVOT1NZUykKPgo+IFN1bW1hcnk6Cj4gcGFzc2VkICAgMAo+
IGZhaWxlZCAgIDE2Cj4gYnJva2VuICAgMAo+IHNraXBwZWQgIDAKPiB3YXJuaW5ncyAwCj4KPiBX
aXRoIHRoaXMgcGF0Y2g6Cj4KPiAkIC9vcHQvbHRwL3Rlc3RjYXNlcy9iaW4vZ2V0cmxpbWl0MDMK
PiAuLi4KPiBnZXRybGltaXQwMy5jOjE2NjogVENPTkY6IF9fTlJfZ2V0cmxpbWl0IG5vdCBpbXBs
ZW1lbnRlZDogRU5PU1lTICgzOCkKPgo+IFN1bW1hcnk6Cj4gcGFzc2VkICAgMAo+IGZhaWxlZCAg
IDAKPiBicm9rZW4gICAwCj4gc2tpcHBlZCAgMQo+IHdhcm5pbmdzIDAKPgo+IEhvdyB0byByZXBy
b2R1Y2U6Cj4KPiBnaXQgY2xvbmUgaHR0cHM6Ly9naXRodWIuY29tL2xpbnV4LXRlc3QtcHJvamVj
dC9sdHAuZ2l0Cj4gY2QgbHRwCj4gbWFrZSBhdXRvdG9vbHMKPiAuL2NvbmZpZ3VyZQo+IG1ha2Ug
YWxsCj4gc3VkbyBtYWtlIGluc3RhbGwKPiAvb3B0L2x0cC90ZXN0Y2FzZXMvYmluL2dldHJsaW1p
dDAzCj4KPiBTaWduZWQtb2ZmLWJ5OiBUaWV6aHUgWWFuZyA8eWFuZ3RpZXpodUBsb29uZ3Nvbi5j
bj4KPiBSZXZpZXdlZC1ieTogTGkgV2FuZyA8bGl3YW5nQHJlZGhhdC5jb20+Cj4gLS0tCj4gIHRl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAzLmMgfCA3ICsrKysr
KysKPiAgMSBmaWxlIGNoYW5nZWQsIDcgaW5zZXJ0aW9ucygrKQo+Cj4gZGlmZiAtLWdpdCBhL3Rl
c3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAzLmMKPiBiL3Rlc3Rj
YXNlcy9rZXJuZWwvc3lzY2FsbHMvZ2V0cmxpbWl0L2dldHJsaW1pdDAzLmMKPiBpbmRleCA2MDQw
ODJjY2YuLmJiNjE2MGMyYiAxMDA2NDQKPiAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxz
L2dldHJsaW1pdC9nZXRybGltaXQwMy5jCj4gKysrIGIvdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxs
cy9nZXRybGltaXQvZ2V0cmxpbWl0MDMuYwo+IEBAIC0xNjIsNiArMTYyLDEyIEBAIHN0YXRpYyB2
b2lkIHJ1bih1bnNpZ25lZCBpbnQgcmVzb3VyY2UpCj4gICAgICAgICBlcnJubyA9IDA7Cj4gICAg
ICAgICByZXRfdWwgPSBnZXRybGltaXRfdWxvbmcocmVzb3VyY2UsICZybGltX3VsKTsKPiAgICAg
ICAgIGVycm5vX3VsID0gZXJybm87Cj4gKyAgICAgICBpZiAoZXJybm9fdWwgPT0gRU5PU1lTKSB7
Cj4gKyAgICAgICAgICAgICAgIHRzdF9yZXMoVENPTkYgfCBURVJSTk8sCj4gKyAgICAgICAgICAg
ICAgICAgICAgICAgIiVzIG5vdCBpbXBsZW1lbnRlZCIsIF9fTlJfZ2V0cmxpbWl0X3Vsb25nX3N0
cik7Cj4gKyAgICAgICAgICAgICAgIHRlc3QudGNudCA9IDE7Cj4gKyAgICAgICAgICAgICAgIHJl
dHVybjsKPiArICAgICAgIH0KPgo+ICAgICAgICAgaWYgKGNvbXBhcmVfcmV0dmFsKHJlc291cmNl
LCByZXRfdTY0LCBlcnJub191NjQsIHJldF91bCwgZXJybm9fdWwsCj4gICAgICAgICAgICAgICAg
ICAgICAgICAgICAgX19OUl9nZXRybGltaXRfdWxvbmdfc3RyKSB8fAo+IEBAIC0xODEsNiArMTg3
LDcgQEAgc3RhdGljIHZvaWQgcnVuKHVuc2lnbmVkIGludCByZXNvdXJjZSkKPiAgICAgICAgIGlm
IChlcnJub19sID09IEVOT1NZUykgewo+ICAgICAgICAgICAgICAgICB0c3RfcmVzKFRDT05GIHwg
VEVSUk5PLAo+ICAgICAgICAgICAgICAgICAgICAgICAgICJfX05SX2dldHJsaW1pdCglZCkgbm90
IGltcGxlbWVudGVkIiwKPiBfX05SX2dldHJsaW1pdCk7Cj4KCgo+ICsgICAgICAgICAgICAgICB0
ZXN0LnRjbnQgPSAxOwo+CgpUaGlzIHNlY29uZCB0ZXN0LnRjbnQgcmVzZXR0aW5nIGlzIHJlZHVu
ZGFudCwgaWYgdGhlIFNJR05FRF9HRVRSTElNSVQKZ2V0IGRlZmluZWQsIHRoYXQgbWVhbnMgYm90
aCBfX05SX2dldHJsaW1pdCBhbmQgX19OUl91Z2V0cmxpbWl0IGFyZQpkZXRlY3RlZCwKYW5kIHRo
ZSBvbmx5IG5lZ2F0aXZlIHNpdHVhdGlvbiBpcyBnZXRybGltaXRfdWxvbmcocmVzb3VyY2UsICZy
bGltX3VsKTsKd29ya3Mgd2VsbCwgYnV0IGdldHJsaW1pdF9sb25nKHJlc291cmNlLCAmcmxpbV9s
KTsgcmV0dXJuIEVOT1NZUywgdG8gbWFrZQp0aGUKdGVzdCBjYW4gYmUgaW50ZXJhY3Rpb24gdGhl
IHNlY29uZCBzaG91bGQgbm8gdGVzdC50Y250ID0gMS4KClNlZToKaHR0cHM6Ly9naXRodWIuY29t
L2xpbnV4LXRlc3QtcHJvamVjdC9sdHAvY29tbWl0L2ZhYzc4M2I1ZDY2MzFlZmE3MGQyZWEzMjU3
MTQyNzYzZDk0NGJhMzIKCkFueXdheSwgSSBtb2RpZmllZCB0aGUgcGF0Y2ggYW5kIG1lcmdlZCEK
CgotLSAKUmVnYXJkcywKTGkgV2FuZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xp
c3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
