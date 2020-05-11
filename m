Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 34FAB1CD49E
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 11:13:26 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 8E53E3C5601
	for <lists+linux-ltp@lfdr.de>; Mon, 11 May 2020 11:13:25 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 3445D3C25C5
 for <ltp@lists.linux.it>; Mon, 11 May 2020 11:13:22 +0200 (CEST)
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com
 [IPv6:2607:f8b0:4864:20::444])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 38C8F6008E6
 for <ltp@lists.linux.it>; Mon, 11 May 2020 11:13:21 +0200 (CEST)
Received: by mail-pf1-x444.google.com with SMTP id f7so4470095pfa.9
 for <ltp@lists.linux.it>; Mon, 11 May 2020 02:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc:content-transfer-encoding;
 bh=vJxWbT7W/ac1d9UuXMlh4KqA4lY7G/IQhFyL/LbCnbs=;
 b=IFpC1tTXU+/H6nO7wFYH2jchuZsH5L3N84u7thcaGjKcNxC9zvATyvZZ26BFQHwGxc
 5Zm750Mqezwz0BkYVMARFN3LBQN3YI4q/i/+NmCl/h9A6t1ivABSM12mT1tIN5a5UNjA
 fdXrhj+d7zJ8R2j6+Hn7yEUsli5ud7uBXpWegx1uSUhHAQcj1BzDBSnhGvFj6TyFrlsB
 JrjYE1s6BhiQge3gSUM0Eh0kC36NlNwQpvS7/kM/S+buNUvlPe0OQ0uSMLqII4dvQ06v
 tEXrAuZLX96phdQW78xvtyF78dybBFturHAHPBxMBPNWaTf2J8WJuekxqkUqbTiN0BGO
 P4jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc:content-transfer-encoding;
 bh=vJxWbT7W/ac1d9UuXMlh4KqA4lY7G/IQhFyL/LbCnbs=;
 b=TnXtBUvHNst3/A5yAJTKcN79lpL1GDlya7PXUfyr2gCIiZGEDlW12zHDIc/ZZ7NumW
 gpkmEajY6sPxFpKcvvWfuLBlg5icfc53HHg71WOudxQ0qLj1m3zmYkH0W6hIZYnjS2+h
 HTg9704v6exj6FBMH0tj1M0rcYX0zgY+uIvsBwWDc8f9aau6lrPsYnhFe0DRURdaEv1T
 x8/eU/QXrQ+wJsOgPv+3+VzvxtqhboyBKXHxtvvz/4I4/eZBrjQgh/SbE/aYU28ih1/1
 kg9yCLoLs/EZTC/ZK9YY+sOuwapiTC35SXswqtRa+xarF5i+ly8DizK+eo8M054Qk+Ut
 ZkRA==
X-Gm-Message-State: AGi0PuYJOSuqO6G0f99iFxtpKLxi6FOuSKKLu6OIpFfwvPKc98o2mJzS
 6FHg3vBsRG9V/hp8yvc/5OOkAnPqhl3tW1cZDuoRDYNA
X-Google-Smtp-Source: APiQypJO3jYWCWnBDDUs55WwZFWviSdx2k+d7lagPLiY5F47Gf5L9J+U5P4N3otoWfMlEdA0DXLLo0djVA1LLKa+ugc=
X-Received: by 2002:a63:db57:: with SMTP id x23mr13135425pgi.94.1589188399793; 
 Mon, 11 May 2020 02:13:19 -0700 (PDT)
MIME-Version: 1.0
References: <20200330152122.GA2699@yuki.lan> <20200331180816.GE2900@yuki.lan>
 <CAF12kFs6H1FgU_77MAMhrn1pK15fp1cx+9wox4k9LN5GxCN=nA@mail.gmail.com>
 <20200401131220.GA3627@yuki.lan>
 <CAF12kFsFsG6Jk0citiGmicq+dyB90i_cG_bcDAMhHiyVPafRdA@mail.gmail.com>
 <20200402093127.GA28452@yuki.lan>
 <CAF12kFvDv8ksxMLDyniwQ=hty6J4Oy5-wvErX=DLrfWmhiwT0w@mail.gmail.com>
 <20200402112309.GA5732@yuki.lan>
 <CAF12kFsCfb12Yi=rhAqKSLPUBLkaWPs_-JCQOcucvyu=whYFsw@mail.gmail.com>
 <CAF12kFvV=a5HJgDOAOGgdr2CMJhtVsYJ199T=SM1kyQSp-Js=w@mail.gmail.com>
 <20200408141853.GB10178@yuki.lan>
In-Reply-To: <20200408141853.GB10178@yuki.lan>
From: Cixi Geng <gengcixi@gmail.com>
Date: Mon, 11 May 2020 17:12:43 +0800
Message-ID: <CAF12kFuJ=bC2ByRN7ihk=CZnA48zVW9KeAoDJO3+VcOJ13C=ug@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
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

PiBJIGhhZCBhIHRpbWUgb2ZmIGFuZCB3YXMgcGxhbnRpbmcgcGxhbnRzIGluIG15IGdhcmRlbiwg
SSB3aWxsIGdldCBiYWNrCj4gdG8gdGhlIHVhcnQgQVNBUCwgYnV0IHRoZW4gd2UgaGF2ZSBhIHB1
YmxpYyBob2xpZGF5IG9uIEZyaWRheSBhbmQgTW9uZGF5Cj4gc28gSSBtYXkgbm90IG1hbmFnZSB0
byBkbyBtdWNoIHVudGlsIG5leHQgd2Vlay4KPgo+IC0tCj4gQ3lyaWwgSHJ1YmlzCj4gY2hydWJp
c0BzdXNlLmN6CgpIaSBDeXJpbDoKSSBoYWQgc3R1ZHkgdGhlIGx0cCBleGVjdXRpb24gZnJhbWV3
b3JrIGFuZCBmb3VuZCB0aGF0IHRoZSBMVFAKZGV0ZWN0aW9uIGRldmljZSBpcwpub3Qgc3VpdGFi
bGUgZm9yIGRldmljZSBkcml2ZXIgdGVzdCBhdCBwcmVzZW50LgpMaWtlIHRoZSBVQVJUIHRlc3Qs
IEkgd2FudCBoYXZlIGEgYXV0by1kZXRlY3Qgd2F5IHRvIGZpbmQgdGhlIGRldmljZQpuZWVkZWQg
dG8gdGVzdAogaW4gdGhlIGN1cnJlbnQgcnVubmluZyBMdFAgbWFjaGluZXMuCk5vdyBJIGhhdmUg
dGVzdCB0aGUgdWFydCBjYXNlIGluIHNldmVyYWwgc3ByZHRyZWFtIFNvYwp0aGVzZSBib2FyZCAg
aGF2ZSBkaWZmZXJlbnQgL2Rldi90dHkqIGRldmljZeOAgmFuZCBJIG5lZGQgcnVuIGluIENJCm1h
bnVhbCBleHBvcnQgZGV2aWNlIHB1enpsZWQgbWUgdG8gZG8gdGhlIGF1dG8tdGVzdC1qb2IuCm1v
cmVvdmVyIEkgd2lsICBwb3J0aW5nIG90aGVyIGRldmljZSBkcml2ZXIgdGVzdGNhc2VzIGluIHRo
ZSBmdXR1cmUuClNvIGNhbiBXZSBleHBhbmQgdGhlIExUUCBkZXRlY3Rpb24gPwoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
