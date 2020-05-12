Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id ECD3A1CEAC9
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 04:33:34 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 953A83C55F6
	for <lists+linux-ltp@lfdr.de>; Tue, 12 May 2020 04:33:34 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id 2B7D73C25D2
 for <ltp@lists.linux.it>; Tue, 12 May 2020 04:33:31 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 76E182009EB
 for <ltp@lists.linux.it>; Tue, 12 May 2020 04:33:30 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id u35so2468834pgk.6
 for <ltp@lists.linux.it>; Mon, 11 May 2020 19:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=nDYLyLM/BWv70aKCNqCWN08EgWwupbUSEz70ma+UjpA=;
 b=IzRes5+OvJfrvXRbP4sz6HEa7L4NTuoM8JRpnSktk+HHJG/c7eml01NU64GS8jzfX3
 9BbbkrZ157dMhhlvpDK5mJ0rMjgT+xKYCdOge5aSY5iURT3P6Nr2LDQh2A6UD4hiZ8Lk
 0bVhSOYr/KinavHi8m9jKbGEkoiogQgWoq34e8fiTpJzpTcxnWEk+dN8OX1GLO5HrtqD
 etqiAmD3uelv4AQH3p2oKXmwAWUHRJqSmn9mopaHA58KidnVWvLIlckVocEuAwWu+mhz
 r0SijR4NW0WWIUOyY3wk0Jn+LYtNfN0D8GgD3H3oixQe+zmc+83Jk2gru+c2gJBAsk/I
 8Ysg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=nDYLyLM/BWv70aKCNqCWN08EgWwupbUSEz70ma+UjpA=;
 b=qjUmfC5PJjR/uyUTX1eNI6oFK4812EeClP6khiEWsbpNQLGZjcJuH3hSxSWaoIoRaJ
 FI5BfbzLNu/UJ4MBDBH5bUIyhegWbefqMdb84BUHC84aDmKAoPU6qIqjQKQ01odssVqe
 zknUlEK3KGUzLe71Y/4+Ejx0qxnF32qesGMkJFtU8dbzKXRQ4UXdiXkT1GlFIi2ktEEt
 TdGQQ53CwUmQf0sFwgZengA1jSj21CLThdT17W/CnUjhB/V3oi4P/9FZDMPo0wW0LbMF
 NUnbOshuGLp1pVecBWX1RoepOmt2i0yWIVS+2CnarNHF6+jVIsaArOezSTFcf8e7jYFP
 cGxw==
X-Gm-Message-State: AOAM531GaG2+DUK6ySv98GwQR3jjFXGHD6ptCt3a2aa46QDl2WL0QF4k
 HBlk3fM+ferYXxDbjgsQftq9WjksIgfJTOXje/g=
X-Google-Smtp-Source: ABdhPJyiW8xCCrslazzaj5WOMXmbWzlaDDHpVdKH4AhxbmulNKd9m3fX81iYzlc3WHuNdj3F+LI7JVpH7l12D6hbWmI=
X-Received: by 2002:a63:7b4b:: with SMTP id k11mr9368070pgn.411.1589250808594; 
 Mon, 11 May 2020 19:33:28 -0700 (PDT)
MIME-Version: 1.0
References: <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
 <20200402112309.GA5732@yuki.lan>
 <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
 <CAF12kFvV=a5HJgDOAOGgdr2CMJhtVsYJ199T=SM1kyQSp-Js=w@mail.gmail.com>
 <20200408141853.GB10178@yuki.lan>
 <CAF12kFuJ=bC2ByRN7ihk=CZnA48zVW9KeAoDJO3+VcOJ13C=ug@mail.gmail.com>
 <20200511093730.GD3070@yuki.lan>
In-Reply-To: <20200511093730.GD3070@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Tue, 12 May 2020 10:32:52 +0800
Message-ID: <CAF12kFuaM4os0aPok0YkQAqxuXDffO1mnYKxuL-8H7H_i9oFxg@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 2/2] device_drivers/uart01: Add uart01 test
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
Cc: Orson Zhai <orsonzhai@gmail.com>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Q3lyaWwgSHJ1YmlzIDxjaHJ1YmlzQHN1c2UuY3o+IOS6jjIwMjDlubQ15pyIMTHml6XlkajkuIAg
5LiL5Y2INTozN+WGmemBk++8mgo+Cj4gSGkhCj4gPiBJIGhhZCBzdHVkeSB0aGUgbHRwIGV4ZWN1
dGlvbiBmcmFtZXdvcmsgYW5kIGZvdW5kIHRoYXQgdGhlIExUUAo+ID4gZGV0ZWN0aW9uIGRldmlj
ZSBpcwo+ID4gbm90IHN1aXRhYmxlIGZvciBkZXZpY2UgZHJpdmVyIHRlc3QgYXQgcHJlc2VudC4K
PiA+IExpa2UgdGhlIFVBUlQgdGVzdCwgSSB3YW50IGhhdmUgYSBhdXRvLWRldGVjdCB3YXkgdG8g
ZmluZCB0aGUgZGV2aWNlCj4gPiBuZWVkZWQgdG8gdGVzdAo+ID4gIGluIHRoZSBjdXJyZW50IHJ1
bm5pbmcgTHRQIG1hY2hpbmVzLgo+ID4gTm93IEkgaGF2ZSB0ZXN0IHRoZSB1YXJ0IGNhc2UgaW4g
c2V2ZXJhbCBzcHJkdHJlYW0gU29jCj4gPiB0aGVzZSBib2FyZCAgaGF2ZSBkaWZmZXJlbnQgL2Rl
di90dHkqIGRldmljZT8/P2FuZCBJIG5lZGQgcnVuIGluIENJCj4gPiBtYW51YWwgZXhwb3J0IGRl
dmljZSBwdXp6bGVkIG1lIHRvIGRvIHRoZSBhdXRvLXRlc3Qtam9iLgo+ID4gbW9yZW92ZXIgSSB3
aWwgIHBvcnRpbmcgb3RoZXIgZGV2aWNlIGRyaXZlciB0ZXN0Y2FzZXMgaW4gdGhlIGZ1dHVyZS4K
PiA+IFNvIGNhbiBXZSBleHBhbmQgdGhlIExUUCBkZXRlY3Rpb24gPwo+Cj4gU29ycnkgSSBoYXZl
bid0IG1hbmFnZWQgdG8gd29yayBvbiB0aGlzIGJlZm9yZSBpdCB3YXMgdGltZSBmb3IgTFRQCj4g
cmVsZWFzZS4gSSB3aWxsIHJlc3VtZSBteSB3b3JrIG9uIHRoaXMgb25jZSBMVFAgaXMgcmVsZWFz
ZWQuCj4KPiBNeSBnZW5lcmFsbCBpZGVhIGlzIHRoYXQgdGhlIExUUCBmcmFtZXdvcmsgd2lsbCBn
ZXQgYSBwYXRoIHRvIGEKPiBkaXJlY3Rvcnkgd2l0aCBzY3JpcHRzIHRoYXQgd291bGQgYmUgZXZh
bHVhdGVkIGF0IHRlc3QgcnVudGltZSBhbmQgd2lsbAo+IHJldHVybiBsaXN0IG9mIGRldmljZXMg
dG8gdGVzdC4gVGhlc2Ugc2NyaXB0cyB3aWxsIGhhdmUgdG8gYmUgc3VwcGxpZWQKPiBieSB0aGUg
dXNlciBhcyBtYW5hZ2luZyBsYWIgaGFyZHdhcmUgaXMgb3V0IG9mIHNjb3BlIG9mIHRoZSBMVFAK
PiBmcmFtZXdvcmsuCj4KPiAtLQo+IEN5cmlsIEhydWJpcwo+IGNocnViaXNAc3VzZS5jegoKVGhh
bmsgeW91IGZvciB5b3VyIGd1aWRhbmNl77yMSW4gdGhlIE5leHQgdGltZSwgSSB3aWxsIHRyeSB0
byBmb3JrIGEKcHJvY2VzcyBpbiBzZXJpYWxjaGVjay5jClNvIGl0IGNhbiBiZSB0ZXN0IFR4ICYg
UnggYXQgb25lIHRpbWUuQW5kIHRoZW4gIHRvIGRldmVsb3AgdGhlCmRldGVjdGlvbiBzY3JpcHRz
IGlmIGhhdmEgYSB0aW1lCiBJJ2xsIGtlZXAgeW91IHBvc3RlZCBvbiB0aGUgc3RhdHVzLgoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
