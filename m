Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id B38C4246F9
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 06:42:00 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 697A1390257
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 06:42:00 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 065053EA496
 for <ltp@lists.linux.it>; Tue, 21 May 2019 06:41:56 +0200 (CEST)
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com
 [IPv6:2607:f8b0:4864:20::643])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 7F4D06011A9
 for <ltp@lists.linux.it>; Tue, 21 May 2019 06:41:58 +0200 (CEST)
Received: by mail-pl1-x643.google.com with SMTP id a5so7756621pls.12
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=fwyqFVs32QTCr9Bl4xWFPHRQ3I23ysbmMptsnm03p/g=;
 b=SW1Ti4kl86ucoP5IvrlNFqtB3DG6fv0Eg1t/8SnGerfc4YRXg79kvFaHOCBw+DSWk+
 KoRKsuRlDgq/gTKleE98QcR8inbWdoFp/dxYDY43H1VCFA+A3cFPuOMmqHT6jit3h8wX
 HvMlNZyJ+K4+CiXY5WJ28FeuhSXyDb1mjUrFLBPb4MBOL5NJnxediBDrXOe9zK5Nfkxx
 pHCk36UNQUxW/62SFFiaC7EnBi5JTht6eIyGuA6JOkunAY7ENMno1R3rmkud2CIsOcS3
 7YWKucnxNZ+y40IiSmNAcCTOgHH0pv2utv5hhW54epbIz+RWRBzJbR4F6+Kdz1iAJdFz
 PEmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=fwyqFVs32QTCr9Bl4xWFPHRQ3I23ysbmMptsnm03p/g=;
 b=PvRavLmiDD7AAz17b3mFj9BP2138ZtOWY8AmMciwK7ls6BDc7Sk9b4AzFQ/493IpEH
 adhKbzhNhI2elp3wXKN2OwPLlRgdc3aJ/gkTRJz+fhRXPVJ3kJc8Esi0EEj9miAxk/ar
 t3nwYYXpKqE72nNc9PQljJzFkxmOQp5+PWrhUeykWp8gF3TBucHaUmMeN+0Be5aK91qT
 QHMhpWxshCGtqBsBHKHh3uHsriEuITjzXAIEcnL5BR4mlcTN5oM532Wn2v3EaWPz1sbH
 wPq6SRMeMH/8NoK7/nq5Ei3ZrXAIfnxYncrjuLR1jBQVLpa/6buYE4oI8wFbishNm+FM
 swZw==
X-Gm-Message-State: APjAAAUvZMlxRZ3nHu0AHji1L6nAR2bYSUXEIMomuYex6IZWI3rDmXD0
 DlbGmSSXpaDxIhK0rAoCPRavTDGBYBEVQw/E
X-Google-Smtp-Source: APXvYqz5grqA8tTmTlhp/3kOQ1DP3tEkpsOUNWjMWaGfXRTztdyzXS6OVYzr2M3KOv87LiC1TFR07g==
X-Received: by 2002:a17:902:7044:: with SMTP id
 h4mr19227701plt.219.1558413714752; 
 Mon, 20 May 2019 21:41:54 -0700 (PDT)
Received: from localhost ([172.56.30.85])
 by smtp.gmail.com with ESMTPSA id z6sm35433316pfr.135.2019.05.20.21.41.53
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 21:41:54 -0700 (PDT)
Date: Tue, 21 May 2019 12:41:48 +0800
From: Sandeep Patil <sspatil@android.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190521044148.GC7753@google.com>
References: <20190520041730.28238-1-sspatil@android.com>
 <20190520094949.GA25405@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520094949.GA25405@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 0/1] Fix return value checks for posix apis
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

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6NDk6NDlBTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gVGhpcyBpcyBhbiBSRkMgcGF0Y2ggdG8gZGVtb25zdHJhdGUgdGhhdCBt
b3N0IG9mIHRoZSBwdGhyZWFkXyogY2FsbHMKPiA+IGluIHRoZSBvcGVuX3Bvc2l4X3Rlc3RzdWl0
ZSBzZWVtIHRvIGJlIGRvaW5nIHRoZSByZXR1cm4gdmFsdWUgY2hlY2tzCj4gPiBpbmNvcnJlY3Rs
eS4gTW9zdCBwb3NpeF8qIGFwaXMgcmV0dXJuIHBvc2l0aXZlIGVycm5vIG9uIGZhaWx1cmUgYW5k
IDAgb24KPiA+IHN1Y2Nlc3MuCj4gCj4gVGhpcyBpcyB1bmZvcnR1bmF0ZWx5IGNvbW1vbiBtaXNj
b25jZXB0aW9uLCBhbHNvIEkgZ3Vlc3MgeW91IG1lYW50Cj4gcHRocmVhZF8qIEFQSXMgaGVyZS4K
CnllcywgcHRocmVhZF8qIEFQSXMuCgo+IAo+ID4gUEFUQ0ggMS8xIGRlbW9uc3RyYXRlcyB0aGUg
Zml4ZXMgbmVlZGVkIGZvciBwdGhyZWFkX3NpZ21hc2svNi0xIGZvcgo+ID4gZXhhbXBsZS4gVGhp
cyBwYXR0ZXJuIGlzIGZhaXJseSB3aWRlc3ByZWFkIGluIG9wZW5fcG9zaXhfdGVzdHN1aXRlLgo+
ID4gCj4gPiBBZnRlciBnb2luZyB0aHJvdWdoIHRoZSBkb2N1bWVudGF0aW9uIGluIHRoZSBwcm9q
ZWN0LCBJIHdhc24ndCBzdXJlIGlmIEkKPiA+IHRlc3RlZCB0aGlzIGNvcnJlY3RseS4gQWZ0ZXIg
YnVpbGRpbmcsIEkgdHJpZWQgdGhlIGZvbGxvd2luZwo+ID4gCj4gPiAkIGNkIHRlc3RjYXNlcy9v
cGVuX3Bvc2l4X3Rlc3RzdWl0ZQo+ID4gJCAuL2Jpbi9ydW5fdGVzaXQuc2ggY29uZm9ybWFuY2Uv
aW50ZXJmYWNlcy9wdGhyZWFkX3NpZ21hc2sgcHRocmVhZF9zaWdtYXNrXzYtMS5ydW4tdGVzdAo+
ID4gCj4gPiAuLi5hbmQgdGhhdCBrZWVwcyBydW5uaW5nIGludG8gdGVzdCBiZWluZyBza2lwcGVk
IGR1ZSB0byBtaXNzaW5nIGZpbGUuCj4gPiAoSSBkbyBoYXZlIHB0aHJlYWRfc2lnbWFza182LTEu
cnVuLXRlc3QgaW4gcGxhY2UpLgo+IAo+IEFjdHVhbGx5IEkgYWx3YXlzIGp1c3QgcnVuIHRoZSBi
aW5hcnksIHNvIGluIHRoaXMgY2FzZSBkb2luZwo+IC4vcHRocmVhZF9zaWdtYXNrXzYtMS5ydW4t
dGVzdCBzaG91bGQgc3VmZmljZS4KCk9rLCBJJ2xsIHRyeSB0aGF0LCBidXQgSUlSQyBpdCBkaWQg
bm90aGluZyBvbiBteSBsYXB0b3AuIEknbGwgcmV0cnkuCgo+IAo+ID4gU28sIGNvbnNpZGVyIHRo
aXMgYnVpbGQgdGVzdGVkIG9ubHkgZm9yIG5vdy4gSSdkIGxvdmUgdG8ga25vdyBob3cgd2UgY2Fu
Cj4gPiB0ZXN0IHRoaXMgYW5kIGlmIHdlIGFyZSBzdGlsbCB1c2luZyB0aGUgdGVzdHN1aXRlLCB0
aGVuIEkgYW0gaGFwcHkgdG8KPiA+IGZpeCByZXN0IG9mIHRoZSBwbGFjZXMgd2hlcmUgaXRzIGJy
b2tlbi4KPiAKPiBTb3VuZHMgZ29vZC4KClRoYW5rcyBmb3IgdGhlIHJldmlldy4KCi0gc3NwCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
