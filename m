Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id A8C37246F8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 06:40:10 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5EB673EA4D8
	for <lists+linux-ltp@lfdr.de>; Tue, 21 May 2019 06:40:10 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id DEA983EA3F5
 for <ltp@lists.linux.it>; Tue, 21 May 2019 06:40:08 +0200 (CEST)
Received: from mail-pf1-x443.google.com (mail-pf1-x443.google.com
 [IPv6:2607:f8b0:4864:20::443])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id D37441001545
 for <ltp@lists.linux.it>; Tue, 21 May 2019 06:40:04 +0200 (CEST)
Received: by mail-pf1-x443.google.com with SMTP id q17so8354792pfq.8
 for <ltp@lists.linux.it>; Mon, 20 May 2019 21:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ficLywgrOg/rDMwMEgJBajV0SbwOkFczLaysZW3mXTE=;
 b=QhaejEQvid/zASIghHo4w5dwx3QL78sHj3Qx/4LSYSTObd4zJLWtVSyvYEx/GYFsiV
 N5xaPF8QcRFGBtzUWhBjrEoNFm3mdqcXyADzFRpnv9FBbISn/QdpvKSy7r7hwt/aAQGe
 ho9rQnmzLsbRWhbGO7IFX9jH6/KsR2ZCp7siuQoAMrWxoiIZRJBOOAGQthIt8pwuKssT
 KAIruaBW6C4BpCV4CKPjbPm89OyWWUSEXY6l7R72T7cpxxEpxRf3vD5Mf8BYQKH3B/dZ
 jvzOx4G1sMdIKnrnj5XJp4DLVgZ5VUCS5pCcKDYfQVNSzFz9B29Ra3TXukCpJOBaCbhD
 6v6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ficLywgrOg/rDMwMEgJBajV0SbwOkFczLaysZW3mXTE=;
 b=h/5NaBPKaGXraSpicgFNkxdXiZgxdxqPd+tzdiZFVZfhZ2ZP3wsyfZJqBaBNHvwEHk
 DaoIN9kaxyk6HORWhL7CklbR5/EQ6xZH9YPeNd+SArXhefDDS/aydfIFKTlDFvogLQXm
 sLLb9g9olCey6tY1BQZUgwxBsjRWuQkLu3c2Rq+6hLvUrrsLJQSWgpfyfuxVMSCphN0b
 oEBNc/kUjbwcblsRBnvTSehOT0CunikPrdiL+vsXUm0X1S+acDwaRAYzaZnM22+/YIdB
 mbf8sW51Oc4APW3Uudg5Bz4PtUoSKq7ddLpEIQ3RoAQ7tGX5gb+VIN7KnlMyTlY33WA+
 S6kg==
X-Gm-Message-State: APjAAAWKWOOiF9/qaDsGamtE+NC0+QAoBqLW530ElANAki4bZYJtVFfD
 8+iol8uQssJxMD6H/J8UqXWdew==
X-Google-Smtp-Source: APXvYqxGSEjrrYMX52obAB5b6aitqbj7/w3ewTuorq6/ZJagVQ1iFI8laSOyntluEdnkPemGh3SsRg==
X-Received: by 2002:a63:4753:: with SMTP id w19mr6313798pgk.421.1558413606272; 
 Mon, 20 May 2019 21:40:06 -0700 (PDT)
Received: from localhost ([172.56.30.85])
 by smtp.gmail.com with ESMTPSA id b4sm21744990pfd.120.2019.05.20.21.40.04
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 20 May 2019 21:40:05 -0700 (PDT)
Date: Tue, 21 May 2019 12:40:01 +0800
From: Sandeep Patil <sspatil@android.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190521044001.GB7753@google.com>
References: <20190520041730.28238-1-sspatil@android.com>
 <20190520041730.28238-2-sspatil@android.com>
 <20190520095356.GB25405@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190520095356.GB25405@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [RFC PATCH 1/1] open_posix_testsuite/pthread_sigmask: fix
 return value checks
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

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTE6NTM6NTdBTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+ID4gQ29uc2lzdGVudGx5IHVzZSBlcnJvcigzKSBhbmQgcmVwbGFjZSBhbGwg
b2NjdXJlbmNlcyBvZiBwZXJyb3IoKQo+ID4gYXQgdGhlIHNhbWUgdGltZS4KPiAKPiBUaGUgZXJy
b3IoMykgaXMgR05VIGV4dGVuc2lvbiB3ZSBjYW5ub3QgdXNlIGl0IGluIGEgUE9TSVggdGVzdHN1
aXRlIGFzCj4gc3VjaCwgSSBndWVzcyB0aGF0IHdlIHdpbGwgaGF2ZSB0byBhZGQgY3VzdG9tIGVy
cm9yIHJlcG9ydGluZyBmdW5jdGlvbnMKPiAoaW4gYSBzZXBhcmF0ZSBwYXRjaCkgdG8gdGhlIG9w
ZW5fcG9zaXhfdGVzdHN1aXRlL2luY2x1ZGUvcG9zaXh0ZXN0LmgKPiBoZWFkZXIuLi4KPiAKPiBP
dGhlciB0aGFuIHRoYXQgdGhlIHBhdGNoIGlzIG9idmlvdXNseSBjb3JyZWN0LgoKVGhhbmtzIHlv
dSB3YW50IG1lIHRvIGFkZCBhbiBlcnJvcigzKS1saWtlIGZ1bmN0aW9uIHRoZXJlPwpJIGd1ZXNz
IEkgY2FuIGRvIHRoYXQgYW5kIHRoZW4gc3RhcnQgY2hhbmdpbmcgYWxsIHRlc3RzLgoKVGhhbmtz
IGZvciBwb2ludGluZyBvdXQgdGhlIEdOVS1leHRlbnNpb24sIGRpZG4ndCByZWFsaXplIHRoYXQu
CgotIHNzcAoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xp
c3RpbmZvL2x0cAo=
