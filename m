Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CDBD32B2F
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 10:54:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id D39C52988E7
	for <lists+linux-ltp@lfdr.de>; Mon,  3 Jun 2019 10:54:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id 043A3294ABA
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 10:54:05 +0200 (CEST)
Received: from mail-yw1-xc42.google.com (mail-yw1-xc42.google.com
 [IPv6:2607:f8b0:4864:20::c42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 7A610140026E
 for <ltp@lists.linux.it>; Mon,  3 Jun 2019 10:53:59 +0200 (CEST)
Received: by mail-yw1-xc42.google.com with SMTP id k128so7220081ywf.2
 for <ltp@lists.linux.it>; Mon, 03 Jun 2019 01:53:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=gSoEMb5AlEom4aRImWzSl36rrXXuGCRSGBywwCEfBy4=;
 b=u4cjeUY77n0xoo08n71myYe+j6qO4J0IZafpyDdUSrVQ8CaUPkePxVpqpgHaWi368J
 6LPEdsgKJ/v+v6GV8x3Yojjv2258qX08i/wI0DB5fubcXu/9trTE74nei9QKssaC49K9
 Kj68fKqu03tmWrH2HGUfh2xzgNFdJaqhI/CmioJQ/X5N/9sX2slNYCVK0PDNj9yIfBp2
 sAsd9XiwAv0NWzbyfvSIGrpOlK/gEr27XWYMFVd4ftg/2WGV9yVdwLjJytwMN5h0T7cS
 WOcb7EuihFXfRJ774eXslaSPvFRNzoeBHG3tHuMGkc9iClEaqC9LjHNlEtrh0Qwl363y
 BDdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gSoEMb5AlEom4aRImWzSl36rrXXuGCRSGBywwCEfBy4=;
 b=NaKf2imXDUyC/3UIY1g+WZuotjPgwGJDKp6WI4ESRWxAjA3Iu1GCQb/fzvn8TGNgzd
 I5KQ+ybLdDeE8CMzzPUOeOR7SZPLXK5Jpa3/pstsd/ejdmv76cl+uM2YEPH5f+clUG4c
 X3LwTkyF499GDL8VCX6PFFTG8lg8EIwP23CuCqXFsFZYiIbxuwjXduQkTVEPnp2+Udge
 03PGGgzagyGja98jghp58xf7rdvuD5dwVEUgbAe2f3+K5RH6bEaF+qD4qcfR941q352R
 xHnz8MdtdzZ8EQUmUqv5MbtxGU1yYUpnRsdL70Ri9f9mXNV97OazGi2c1EVwLJTNYHPA
 xnxg==
X-Gm-Message-State: APjAAAX03VyHw3n87aXhhZPz4qceHsBrHAVly85egxm/eR11CNGuVfZ0
 337yduXwTts/jG1GRlKBYv89rS5VSh0NjdywbHU=
X-Google-Smtp-Source: APXvYqyLhyAKheggAHcdBGLLSLjM08qy1PTwfxZDP5SXh1CYHIzC2l75XTM9E8LyXKVI1k0o1MHXgHivPidC1QL27t4=
X-Received: by 2002:a0d:f5c4:: with SMTP id e187mr3162562ywf.88.1559552038270; 
 Mon, 03 Jun 2019 01:53:58 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1558242368.git.mbobrowski@mbobrowski.org>
In-Reply-To: <cover.1558242368.git.mbobrowski@mbobrowski.org>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 3 Jun 2019 11:53:47 +0300
Message-ID: <CAOQ4uxjpWwzRaSYTUuFZhVOhMRxrENizGfVpvRJJkq30UAshYg@mail.gmail.com>
To: Matthew Bobrowski <mbobrowski@mbobrowski.org>,
 Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v3 0/3] syscalls/fanotify: FAN_REPORT_FID and
 Directory Modification Events
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.18
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

T24gU3VuLCBNYXkgMTksIDIwMTkgYXQgODoyNSBBTSBNYXR0aGV3IEJvYnJvd3NraQo8bWJvYnJv
d3NraUBtYm9icm93c2tpLm9yZz4gd3JvdGU6Cj4KPiBUaGlzIHBhdGNoIHNlcmllcyBjb250YWlu
cyB0aGUgY2hhbmdlcyBuZWVkZWQgdG8gdmFsaWRhdGUgdGhlIG5ldwo+IEZBTl9SRVBPUlRfRklE
IGZsYWcgYW5kIGRpcmVjdG9yeSBtb2RpZmljYXRpb24gZXZlbnQgZnVuY3Rpb25hbGl0eQo+IHdp
dGhpbiB0aGUgZmFub3RpZnkgQVBJLgo+Cj4gQ2hhbmdlcyBzaW5jZSB2ZXJzaW9uIDI6Cj4gICAg
ICAgICAqIEFkZGVkIGFuIGlmZGVmIHN0YXRlbWVudCB3aXRoaW4gZmFub3RpZnlfZ2V0X2ZpZCgp
IHRvIGNoZWNrCj4gICAgICAgICAgIGZvciBuYW1lX3RvX2hhbmRsZV9hdCgpIHN1cHBvcnQuCj4K
PiBNYXR0aGV3IEJvYnJvd3NraSAoMyk6Cj4gICBzeXNjYWxscy9mYW5vdGlmeTEzOiBuZXcgdGVz
dCB0byB2ZXJpZnkgRkFOX1JFUE9SVF9GSUQgZnVuY3Rpb25hbGl0eQo+ICAgc3lzY2FsbHMvZmFu
b3RpZnkxNDogbmV3IHRlc3QgdG8gdmFsaWRhdGUgRkFOX1JFUE9SVF9GSUQgaW50ZXJmYWNlCj4g
ICB2YWx1ZXMKPiAgIHN5c2NhbGxzL2Zhbm90aWZ5MTU6IHZlcmlmeSBmaWQgZm9yIGRpcmVudCBl
dmVudHMKPgo+ICBjb25maWd1cmUuYWMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDEgKwo+ICBydW50ZXN0L3N5c2NhbGxzICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDMgKwo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5Ly5naXRpZ25vcmUg
fCAgIDMgKwo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90aWZ5L2Zhbm90aWZ5Lmgg
fCAgODEgKysrKy0KPiAgLi4uL2tlcm5lbC9zeXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTEzLmMg
ICAgIHwgMzEzICsrKysrKysrKysrKysrKysrKwo+ICAuLi4va2VybmVsL3N5c2NhbGxzL2Zhbm90
aWZ5L2Zhbm90aWZ5MTQuYyAgICAgfCAxNzEgKysrKysrKysrKwo+ICAuLi4va2VybmVsL3N5c2Nh
bGxzL2Zhbm90aWZ5L2Zhbm90aWZ5MTUuYyAgICAgfCAyNDUgKysrKysrKysrKysrKysKPiAgNyBm
aWxlcyBjaGFuZ2VkLCA4MTQgaW5zZXJ0aW9ucygrKSwgMyBkZWxldGlvbnMoLSkKPiAgY3JlYXRl
IG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2FsbHMvZmFub3RpZnkvZmFub3RpZnkx
My5jCj4gIGNyZWF0ZSBtb2RlIDEwMDY0NCB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2Zhbm90
aWZ5L2Zhbm90aWZ5MTQuYwo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9z
eXNjYWxscy9mYW5vdGlmeS9mYW5vdGlmeTE1LmMKPgo+IC0tCgoKSGkgQ3lyaWwsCgpKdXN0IHdh
bnRlZCB0byBtYWtlIHN1cmUgdGhlcmUgd2FzIG5vdGhpbmcgYmxvY2tpbmcgdGhpcyBwYXRjaCBz
ZXQKKGFwYXJ0IGZyb20geW91ciBsaW1pdGVkIHJldmlldyB0aW1lKQoKVGhhbmtzLApBbWlyLgoK
LS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0
cAo=
