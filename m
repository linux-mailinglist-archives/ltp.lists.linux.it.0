Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D50714A11
	for <lists+linux-ltp@lfdr.de>; Mon, 29 May 2023 15:15:55 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 068563CD019
	for <lists+linux-ltp@lfdr.de>; Mon, 29 May 2023 15:15:54 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature ECDSA (P-384) server-digest SHA384)
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A9D243C4BFF
 for <ltp@lists.linux.it>; Mon, 29 May 2023 15:15:50 +0200 (CEST)
Received: from mail-yw1-x1135.google.com (mail-yw1-x1135.google.com
 [IPv6:2607:f8b0:4864:20::1135])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 7DA7A200760
 for <ltp@lists.linux.it>; Mon, 29 May 2023 15:15:49 +0200 (CEST)
Received: by mail-yw1-x1135.google.com with SMTP id
 00721157ae682-565a63087e9so44369447b3.2
 for <ltp@lists.linux.it>; Mon, 29 May 2023 06:15:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20221208; t=1685366148; x=1687958148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jNJv+PrDzjttfOFh4xwhFfRvuqaxgX/4LA6m2e9aZr8=;
 b=SwXJHMF+oduRPX+oWgzDBamm1+MRkZN1u12mnM685hAk2jOE+5xSAGp5MY0ynuJIpo
 gvrOBe/bWFnxAuGJABr9FdthKrr3rEmtUxJno/YRQjrgq7f5wTSBnH7d1aFJ6yWPIZJE
 eRDoeflHvsLFNOZHn2JFfdKJnk6q3GtXs37DlXRIe2t3p+NWkFdn1xc3Bvi2lC71077G
 j951XrzkLrXifJK2a3FvQql17kWX/KvQUw5KzvM4ikrN6/iFFZAifiE4gO+NGvYnyoKU
 v3UXcCjfbngecd9y8hLuu6o8WXzHIXe/Z+s/bFaBffDxCWdP5Jn60s2cHZe/B4EMeNaj
 rl/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685366148; x=1687958148;
 h=content-transfer-encoding:cc:to:subject:message-id:date:from
 :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jNJv+PrDzjttfOFh4xwhFfRvuqaxgX/4LA6m2e9aZr8=;
 b=ZoBkWHaTAlQ6oYqbL6LrzC3waLqbM3MZbbE1FSkCZZx3/d/MWTm+/aSD8WCSU4hmC0
 2BhR2y+6hmH/EedYmUSAOJAwccjHitnV+KFZcXTCNtyC7nBN+CmyRMXYysAtrFHWbbc0
 ZSJzQRIHdLsYyLUNA+pFX9g0A2iGV2LB8yjSqzjBbFmc3UVI4qxL0whYBM3yHxM4Sw+/
 opYNy4BmvNdANJD8jH41Vm3hNrOvptsQX8g1xQkumZQE+8scso9oLRE69ofvCAbvkWWT
 okdhyt0X1pE70ATe52o93cFpciqfHNZkO9Os9TFa7/BGm6+Hp8ZVzyTMNpyGtjeALdKt
 pCJw==
X-Gm-Message-State: AC+VfDxBQnLmsVUwa76Mxff21WU5FL71gxo7FLQ9vvjD/U9ATpNskVOZ
 AJ0m7RCvYr6B0M8Xj6f04ywny5ET+bvcskWXSvk=
X-Google-Smtp-Source: ACHHUZ6OY9Sz5AhH/ARGZOmb2o44+d0OQTndDE86RjAPKcDl2jkZ78TeOiqsrAzQslrVLZynVvKjTtcXU+voyVdUENQ=
X-Received: by 2002:a0d:f7c5:0:b0:565:ab9f:7623 with SMTP id
 h188-20020a0df7c5000000b00565ab9f7623mr14131597ywf.36.1685366148173; Mon, 29
 May 2023 06:15:48 -0700 (PDT)
MIME-Version: 1.0
References: <CADJHv_sedgbfxvZkKHjC6quKvxR+E54noFCVF93MvhyK6bwRoA@mail.gmail.com>
 <97ffe91e-bb31-cceb-fb7e-8f7a2252734f@kernel.org>
 <CADJHv_uXXVdog0GsFCTd+eouVAuX_wT9NRKJeUUqfZNvz34b0w@mail.gmail.com>
 <036846b9-c757-450b-2612-6a649b901888@kernel.org>
 <CADJHv_vUgoYuuSjqp1OsmRogZ7QRkWydo9s4joEnjdcdUkEvFA@mail.gmail.com>
In-Reply-To: <CADJHv_vUgoYuuSjqp1OsmRogZ7QRkWydo9s4joEnjdcdUkEvFA@mail.gmail.com>
From: Murphy Zhou <jencce.kernel@gmail.com>
Date: Mon, 29 May 2023 21:15:36 +0800
Message-ID: <CADJHv_sHzBig=ducWkdPNoWgDTg7xQuLWvQZgHk0=46i4Yvncw@mail.gmail.com>
To: Damien Le Moal <dlemoal@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>
X-Virus-Scanned: clamav-milter 1.0.1 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS,
 T_SCC_BODY_TEXT_LINE shortcircuit=no autolearn=disabled version=4.0.0
X-Spam-Checker-Version: SpamAssassin 4.0.0 (2022-12-13) on in-7.smtp.seeweb.it
Subject: Re: [LTP] ioprio_set can take 8 as the PROCESS CLASS_BE ioprio value
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
Cc: linux-block@vger.kernel.org, Jens Axboe <axboe@kernel.dk>,
 Linux-Next <linux-next@vger.kernel.org>, Jan Kara <jack@suse.cz>,
 LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

QWRkaW5nIGlvcHJpb19zZXQwMy5jIGF1dGhvciBXYWxsZWpqLgoKT24gTW9uLCBNYXkgMjksIDIw
MjMgYXQgMTo0NuKAr1BNIE11cnBoeSBaaG91IDxqZW5jY2Uua2VybmVsQGdtYWlsLmNvbT4gd3Jv
dGU6Cj4KPiBPbiBNb24sIE1heSAyOSwgMjAyMyBhdCAxMDoyOOKAr0FNIERhbWllbiBMZSBNb2Fs
IDxkbGVtb2FsQGtlcm5lbC5vcmc+IHdyb3RlOgo+ID4KPiA+ICtKZW5zCj4gPgo+ID4gYW5kIGFs
c28gK0phbiBhcyBoZSBkaWQgc29tZSB3b3JrIG9uIGlvcHJpbyBwcmV2aW91c2x5Lgo+ID4KPiA+
IE9uIDUvMjcvMjMgMDk6MDIsIE11cnBoeSBaaG91IHdyb3RlOgo+ID4gPiBPbiBGcmksIE1heSAy
NiwgMjAyMyBhdCAzOjQy4oCvUE0gRGFtaWVuIExlIE1vYWwgPGRsZW1vYWxAa2VybmVsLm9yZz4g
d3JvdGU6Cj4gPiA+Pgo+ID4gPj4gT24gNS8yNi8yMyAxNjoyNywgTXVycGh5IFpob3Ugd3JvdGU6
Cj4gPiA+Pj4gSGkgRGFtaWVuLAo+ID4gPj4+Cj4gPiA+Pj4gU2luY2UgdGhlc2UgY29tbWl0czoK
PiA+ID4+Pgo+ID4gPj4+ICAgc2NzaTogYmxvY2s6IEludHJvZHVjZSBpb3ByaW8gaGludHMKPiA+
ID4+PiAgIHNjc2k6IGJsb2NrOiBpb3ByaW86IENsZWFuIHVwIGludGVyZmFjZSBkZWZpbml0aW9u
Cj4gPiA+Pj4KPiA+ID4+PiBnbyBpbnRvIGxpbnV4LW5leHQgdHJlZSwgaW9wcmlvX3NldCBjYW4g
dGFrZSB0aGUgdmFsdWUgb2YgOAo+ID4gPj4+IGFzIHRoZSBQUk9DRVNTIENMQVNTX0JFIGlvcHJp
byBwYXJhbWV0ZXIsIHJldHVybmluZwo+ID4gPj4+IHN1Y2Nlc3MgYnV0IGFjdHVhbGx5IGl0IGlz
IHNldHRpbmcgdG8gMCBkdWUgdG8gdGhlIG1hc2sgcm91bmR1cC4KPiA+ID4+Pgo+ID4gPj4+IFRo
ZSBMVFAgdGVzdCBjYXNlIGlvcHJpb19zZXQwM1sxXSBjb3ZlcnMgdGhpcyBib3VuZGFyeSB2YWx1
ZQo+ID4gPj4+IHRlc3RpbmcsIHdoaWNoIHN0YXJ0cyB0byBmYWlsIHNpbmNlIHRoZW4uCj4gPiA+
Pj4KPiA+ID4+PiBUaGlzIGRvZXMgbm90IGxvb2sgYXMgZXhwZWN0ZWQuIENvdWxkIHlvdSBoZWxw
IHRvIHRha2UgYSBsb29rPwo+ID4gPj4KPiA+ID4+IEJlZm9yZSB0aGUgcGF0Y2hlcywgdGhlIGlv
cHJpbyBsZXZlbCBvZiA4IGNvdWxkIGluZGVlZCBiZSBzZXQsIGJ1dCB0aGF0IHdhcwo+ID4gPgo+
ID4gPiBCZWZvcmUgdGhlIHBhdGNoZXMsIGl0IGNhbid0IGJlIHNldCB0byA4IGJlY2F1c2UgdGhl
IGNoZWNrIGluCj4gPiA+IGlvcHJpb19jaGVja19jYXAgcmVmdXNlZCBpdC4KPiA+ID4gICAgPj0g
SU9QUklPX05SX0xFVkVMUwo+ID4gPiBCZWZvcmUgdGhlIHBhdGNoZXMsIHRoZSB2YWx1ZSBjYW4g
YmUgZ3JlYXRlciB0aGFuIDgsIHNvIGl0IHRha2VzIGVmZmVjdC4KPiA+ID4gQWZ0ZXIgdGhlIHBh
dGNoZXMsIHRoZSB2YWx1ZSBpcyBsaW1pdGVkIHRvIFswLi43XSwgdGhpcyBjaGVjayBhbHdheXMg
cGFzc2VzLgo+ID4gPgo+ID4gPj4gYWN0dWFsbHkgdG90YWxseSBtZWFuaW5nbGVzcyBzaW5jZSB0
aGUga2VybmVsIGNvbXBvbmVudHMgdGhhdCB1c2UgdGhlIHByaW9yaXR5Cj4gPiA+PiBsZXZlbCBh
bGwgYXJlIGxpbWl0ZWQgdG8gdGhlIHJhbmdlIFswLi43XS4gQW5kIHdoeSB0aGUgbGV2ZWwgdmFs
dWUgOCBjb3VsZCBiZQo+ID4gPj4gc2VlbiwgdGhlIGVmZmVjdGl2ZSBsZXZlbCB3b3VsZCBoYXZl
IGJlZW4gMC4gU28gYXQgbGVhc3QsIHdpdGggdGhlIGNoYW5nZXMsIHdlCj4gPiA+PiBhcmUgbm90
IGx5aW5nIHRvIHRoZSB1c2VyLi4uCj4gPiA+Pgo+ID4gPj4gSSBhbSBub3Qgc3VyZSB3aGF0IHRo
aXMgaW9wcmlvX3NldDAzIHRlc3QgaXMgdHJ5aW5nIHRvIGNoZWNrLgo+ID4gPgo+ID4gPiBJIGd1
ZXNzIGl0IGlzIHRyeWluZyB0byBtYWtlIHN1cmUgYm91bmRhcnkgdmFsdWVzIGRvIG5vdCBjYXVz
ZSB1bmNlcnRhaW5pbmcuCj4gPiA+IFRoZSB0ZXN0IGNhc2UgY2FuIGJlIHVwZGF0ZWQgYWNjb3Jk
aW5nIHRvIGludGVuZGVkIGtlcm5lbCBjaGFuZ2VzLiBTbyBkb2VzCj4gPiA+IG90aGVyIHVzZXIg
c3BhY2UgYXBwbGljYXRpb25zIHRoYXQgbWF5IGRlcGVuZCBvbiB0aGlzLCBvciB0aGVyZSBpcyBu
b25lIG9mCj4gPiA+IHRoZW0gdG8gd29ycnkgYWJvdXQuCj4gPgo+ID4gVGhlIGNoZWNrcyBiZWZv
cmUgdGhlIHBhdGNoIHdhcyB1c2luZyBJT1BSSU9fUFJJT19EQVRBKCkgdG8gZ2V0IHRoZQo+ID4g
bGV2ZWwgdmFsdWUsIGFuZCB0aGF0IG1hY3JvIHdhcyBkb2luZyBhIG1hc2sgd2l0aCBJT1BSSU9f
UFJJT19NQVNLICgxIDw8Cj4gPiAxMykuIFNvIGlmIHRoZSBhcHBsaWNhdGlvbiB3YXMgZG9pbmc6
Cj4gPgo+ID4gSU9QUklPX1BSSU9fVkFMVUUoSU9QUklPX0NMQVNTX0JFLCA4MTkyICsgMSkKPiA+
Cj4gPiB0aGVuIHRoZSBpb3ByaW8gdmFsdWUgd291bGQgZW5kIHVwIGJlaW5nIHRoZSBzYW1lIGFz
Ogo+ID4KPiA+IElPUFJJT19QUklPX1ZBTFVFKElPUFJJT19DTEFTU19CRSwgMCkKPiA+Cj4gPiB3
aGljaCBpcyBhIHZhbGlkIGlvcHJpbyB2YWx1ZS4gU28gaW9wcmlvX2NoZWNrX2NhcCgpIHdvdWxk
IG5vdCBkZXRlY3QKPiA+IHRoYXQgY2FzZSBlaXRoZXIuIFRoZSBmYWN0IHRoYXQgY2xhc3MgYW5k
IGxldmVsIGFyZSBjb21iaW5lZCBpbnRvIGEKPiA+IHNpbmdsZSB2YWx1ZSBlc3NlbnRpYWxseSBw
cmV2ZW50cyB1cyB0byBiZSBleGhhdXN0aXZlIHdpdGggdGhlIGNoZWNrcyBpbgo+ID4gaW9wcmlv
X2NoZWNrX2NhcCgpLgo+ID4KPiA+IEkgYW0gbm90IHN1cmUgaWYgdGhpcyBpcyB3b3J0aCBmaXhp
bmcuIGFzIG5vIG1hdHRlciB3aGF0IHdlIGRvLCB0aGUKPiA+IGFib3ZlIHByb2JsZW0gcmVtYWlu
czogd2UgY2Fubm90IGNhdGNoIGFsbCBiYWQgY2FzZXMgYW5kIGVuZCB1cCB3aXRoIGEKPiA+IHZh
bGlkIHZhbHVlIHdoaWNoIHdpbGwgcHJldmVudCB0aGUgdXNlciBmcm9tIHNlZWluZyBhbiBlcnJv
ciBhbmQKPiA+IGNhdGNoaW5nIGhpcy9oZXJzIGludmFsaWQgdXNlIG9mIHRoZSBpb3ByaW8gdmFs
dWVzLi4uCj4KPiBBZ3JlZS4gIFdlIGNhbid0IHByZXZlbnQgdGhhdC4gUGxlYXNlIGdvIGFoZWFk
IHdpdGggYW55IHNvbHV0aW9uIHRoYXQKPiBtYWtlcyBzZW5zZSB0byB5b3UuCj4KPiBUaGFua3Ms
Cj4gTXVycGh5Cj4gPgo+ID4gV2UgY291bGQgZG8gc29tZXRoaW5nIGxpa2Ugc2hvd24gYmVsb3cs
IGJ1dCBJIGFtIG5vdCBzdXJlIGlmIGl0IGlzIHdvcnRoCj4gPiBpdCBhcyB0aGVpciBhcmUgbm8g
Z3VhcmFudGVlcyB0aGF0IHRoZSB1c2VyIGlzIGFjdHVhbGx5IHVzaW5nIHRoZQo+ID4gZGVmaW5p
dGlvbnMgaW4gaW5jbHVkZS91YXBpL2xpbnV4L2lvcHJpby5oCj4gPiAoL3Vzci9pbmNsdWRlL2xp
bnV4L2lvcnByaW8uaCkuIEUuZy4gc2VlIGZpbyBjb2RlIHdoaWNoIHJlZGVmaW5lcyB0aGUKPiA+
IHZhbHVlcyBhbmQgbWFjcm9zIGxvY2FsbHkuCj4gPgo+ID4gZGlmZiAtLWdpdCBhL2luY2x1ZGUv
dWFwaS9saW51eC9pb3ByaW8uaCBiL2luY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaAo+ID4gaW5k
ZXggNjA3Yzc2MTdiOWQyLi5jMDljZmJlZTkxMTcgMTAwNjQ0Cj4gPiAtLS0gYS9pbmNsdWRlL3Vh
cGkvbGludXgvaW9wcmlvLmgKPiA+ICsrKyBiL2luY2x1ZGUvdWFwaS9saW51eC9pb3ByaW8uaAo+
ID4gQEAgLTYsMTUgKzYsMTMgQEAKPiA+ICAgKiBHaXZlcyB1cyA4IHByaW8gY2xhc3NlcyB3aXRo
IDEzLWJpdHMgb2YgZGF0YSBmb3IgZWFjaCBjbGFzcwo+ID4gICAqLwo+ID4gICNkZWZpbmUgSU9Q
UklPX0NMQVNTX1NISUZUICAgICAxMwo+ID4gLSNkZWZpbmUgSU9QUklPX0NMQVNTX01BU0sgICAg
ICAweDA3Cj4gPiArI2RlZmluZSBJT1BSSU9fTlJfQ0xBU1NFUyAgICAgIDgKPiA+ICsjZGVmaW5l
IElPUFJJT19DTEFTU19NQVNLICAgICAgKElPUFJJT19OUl9DTEFTU0VTIC0gMSkKPiA+ICAjZGVm
aW5lIElPUFJJT19QUklPX01BU0sgICAgICAgKCgxVUwgPDwgSU9QUklPX0NMQVNTX1NISUZUKSAt
IDEpCj4gPgo+ID4gICNkZWZpbmUgSU9QUklPX1BSSU9fQ0xBU1MoaW9wcmlvKSAgICAgIFwKPiA+
ICAgICAgICAgKCgoaW9wcmlvKSA+PiBJT1BSSU9fQ0xBU1NfU0hJRlQpICYgSU9QUklPX0NMQVNT
X01BU0spCj4gPiAgI2RlZmluZSBJT1BSSU9fUFJJT19EQVRBKGlvcHJpbykgICAgICAgKChpb3By
aW8pICYgSU9QUklPX1BSSU9fTUFTSykKPiA+IC0jZGVmaW5lIElPUFJJT19QUklPX1ZBTFVFKGNs
YXNzLCBkYXRhKSBcCj4gPiAtICAgICAgICgoKChjbGFzcykgJiBJT1BSSU9fQ0xBU1NfTUFTSykg
PDwgSU9QUklPX0NMQVNTX1NISUZUKSB8IFwKPiA+IC0gICAgICAgICgoZGF0YSkgJiBJT1BSSU9f
UFJJT19NQVNLKSkKPiA+Cj4gPiAgLyoKPiA+ICAgKiBUaGVzZSBhcmUgdGhlIGlvIHByaW9yaXR5
IGNsYXNzZXMgYXMgaW1wbGVtZW50ZWQgYnkgdGhlIEJGUSBhbmQKPiA+IG1xLWRlYWRsaW5lCj4g
PiBAQCAtNzMsMTUgKzcxLDYgQEAgZW51bSB7Cj4gPiAgI2RlZmluZSBJT1BSSU9fUFJJT19ISU5U
KGlvcHJpbykgICAgICAgXAo+ID4gICAgICAgICAoKChpb3ByaW8pID4+IElPUFJJT19ISU5UX1NI
SUZUKSAmIElPUFJJT19ISU5UX01BU0spCj4gPgo+ID4gLS8qCj4gPiAtICogQWx0ZXJuYXRlIG1h
Y3JvIGZvciBJT1BSSU9fUFJJT19WQUxVRSgpIHRvIGRlZmluZSBhbiBJTyBwcmlvcml0eSB3aXRo
Cj4gPiAtICogYSBjbGFzcywgbGV2ZWwgYW5kIGhpbnQuCj4gPiAtICovCj4gPiAtI2RlZmluZSBJ
T1BSSU9fUFJJT19WQUxVRV9ISU5UKGNsYXNzLCBsZXZlbCwgaGludCkgICAgICAgICAgICAgIFwK
PiA+IC0gICAgICAgKCgoKGNsYXNzKSAmIElPUFJJT19DTEFTU19NQVNLKSA8PCBJT1BSSU9fQ0xB
U1NfU0hJRlQpIHwgXAo+ID4gLSAgICAgICAgKCgoaGludCkgJiBJT1BSSU9fSElOVF9NQVNLKSA8
PCBJT1BSSU9fSElOVF9TSElGVCkgfCAgICBcCj4gPiAtICAgICAgICAoKGxldmVsKSAmIElPUFJJ
T19MRVZFTF9NQVNLKSkKPiA+IC0KPiA+ICAvKgo+ID4gICAqIElPIGhpbnRzLgo+ID4gICAqLwo+
ID4gQEAgLTEwNyw0ICs5NiwyMiBAQCBlbnVtIHsKPiA+ICAgICAgICAgSU9QUklPX0hJTlRfREVW
X0RVUkFUSU9OX0xJTUlUXzcgPSA3LAo+ID4gIH07Cj4gPgo+ID4gKy8qCj4gPiArICogUmV0dXJu
IGFuIEkvTyBwcmlvcml0eSB2YWx1ZSBiYXNlZCBvbiBhIGNsYXNzLCBhIGxldmVsIGFuZCBoaW50
cy4KPiA+ICsgKi8KPiA+ICtzdGF0aWMgaW5saW5lIHUxNiBpb3ByaW9fdmFsdWUoaW50IGNsYXNz
LCBpbnQgbGV2ZWwsIGludCBoaW50KQo+ID4gK3sKPiA+ICsgICAgICAgaWYgKGNsYXNzIDwgMCB8
fCBjbGFzcyA+PSBJT1BSSU9fTlJfQ0xBU1NFUyB8fAo+ID4gKyAgICAgICAgICAgbGV2ZWwgPCAw
IHx8IGxldmVsID49IElPUFJJT19OUl9MRVZFTFMgfHwKPiA+ICsgICAgICAgICAgIGhpbnQgPCAw
IHx8IGhpbnQgPj0gSU9QUklPX05SX0hJTlRTKQo+ID4gKyAgICAgICAgICAgICAgIHJldHVybiBV
U0hSVF9NQVg7Cj4gPiArICAgICAgIHJldHVybiAoY2xhc3MgPDwgSU9QUklPX0NMQVNTX1NISUZU
KSB8Cj4gPiArICAgICAgICAgICAgICAoaGludCA8PCBJT1BSSU9fSElOVF9TSElGVCkgfCBsZXZl
bDsKPiA+ICt9Cj4gPiArCj4gPiArI2RlZmluZSBJT1BSSU9fUFJJT19WQUxVRShjbGFzcywgbGV2
ZWwpICAgICAgICAgICAgICAgICAgICAgICAgXAo+ID4gKyAgICAgICBpb3ByaW9fdmFsdWUoY2xh
c3MsIGxldmVsLCBJT1BSSU9fSElOVF9OT05FKQo+ID4gKyNkZWZpbmUgSU9QUklPX1BSSU9fVkFM
VUVfSElOVChjbGFzcywgbGV2ZWwsIGhpbnQpICAgICBcCj4gPiArICAgICAgIGlvcHJpb192YWx1
ZShjbGFzcywgbGV2ZWwsIGhpbnQpCj4gPiArCj4gPiAgI2VuZGlmIC8qIF9VQVBJX0xJTlVYX0lP
UFJJT19IICovCj4gPgo+ID4gLS0KPiA+IERhbWllbiBMZSBNb2FsCj4gPiBXZXN0ZXJuIERpZ2l0
YWwgUmVzZWFyY2gKPiA+CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGlu
dXguaXQvbGlzdGluZm8vbHRwCg==
