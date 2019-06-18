Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6021F4ABAF
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 22:25:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3B4C5294AC2
	for <lists+linux-ltp@lfdr.de>; Tue, 18 Jun 2019 22:25:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 8EEED3EA379
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 22:25:05 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id A98711400BE7
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 22:25:04 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bi6so6152733plb.12
 for <ltp@lists.linux.it>; Tue, 18 Jun 2019 13:25:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=Ir7pG0ka/PuZ5PBCJLlxvUt6L+Ii3EuxbH0ibdknNJY=;
 b=Ar1AWR2OEQ0V7HUI2Jun13jD4k2LPJdqW37nwqg4iBHlKb9QjfGLebbCOhVitQc+fw
 L6f/mvLVgJxNHAB+3piyVCy/jNQOl8gzRZ5ApEKu8MjXkYzOSUqbDRs+i5uWmlZtRKF5
 oe4kD5jjUMx3OjUoWD8qWLmmuPj/L9vvdbnIxsCEAc+h0b3PEpqQyv4zk6okoGKdWur6
 G+YkJ9TRLoOJniSlwMpippjdhSseo9z8RNA67jRjTCEA6cpnA/VDjU1q5Z5xHvABkvDv
 +hl9KvPvkLp0I1fB7A0J9nqsVCwL5Avl5ncESpl4JNdwBmlRnIYzyvv6/Bjs0JmzEMEa
 Z6dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=Ir7pG0ka/PuZ5PBCJLlxvUt6L+Ii3EuxbH0ibdknNJY=;
 b=JbEyX0b7ZxVXHes19z7XuZ6IKMrSAJtJ7/7jpE+/3voZQGUfmMyHUtvwJSDJrl4HSo
 hrcuGeQP0dNrdNOIYsgEPUsBcafQwfDBMUsSTdznxeArnv7rS78tpOcnfGcoSylMBfUJ
 kRErQRjVGZ21ujJ5U6tt5GGyECyl22nUzt8Of/eNH81BuMzKCtNpGUsyz0jxhY53S5p7
 85ge4FegL20NWWKEiKPqKxpDe4ndwe6jWUCyHyFltgEpQiSrE5kpXAdzjou/rNM8z7Fj
 8Gbyo9z8d4xrukOtKi94XSxTUMjcO67yhSXcG1TzrdRgH9NxFohbiQnjyCKv79PXM9//
 CJ4w==
X-Gm-Message-State: APjAAAWcSmPQJVHmC10Xu2LTj0J/M9RslpKKgU4UU/LFdpXrYz9zXl0i
 jj07POYl57MbAYb4qWjGJHARXg==
X-Google-Smtp-Source: APXvYqwPTdm8CVkm+HcFO2Wm6uZX4kqhh7UvUkrgohTL6nZpcVCDuVHrf3jj9YT/ySGt5NW4s9WGwA==
X-Received: by 2002:a17:902:205:: with SMTP id
 5mr107963541plc.165.1560889503178; 
 Tue, 18 Jun 2019 13:25:03 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3fed:2d30:9d40:70a3])
 by smtp.gmail.com with ESMTPSA id w14sm10664587pfn.47.2019.06.18.13.25.02
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Tue, 18 Jun 2019 13:25:02 -0700 (PDT)
Date: Tue, 18 Jun 2019 13:25:01 -0700
From: Sandeep Patil <sspatil@android.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190618202501.GD203031@google.com>
References: <20190610002610.2187-1-sspatil@android.com>
 <20190610002610.2187-4-sspatil@android.com>
 <20190613145507.GD29926@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190613145507.GD29926@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 3/3] syscalls/bind01: convert to new library.
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

T24gVGh1LCBKdW4gMTMsIDIwMTkgYXQgMDQ6NTU6MDdQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+IFB1c2hlZCB3aXRoIG1pbm9yIGNoYW5nZXMsIHRoYW5rcy4KPiAKPiBIb3dl
dmVyIHRoZSB0ZXN0IGZhaWxzIHdpdGggLWkgMiBhZnRlciB0aGlzIHBhdGNoIHNpbmNlIG9uIHNl
Y29uZAo+IGl0ZXJhdGlvbiBzaW5jZSB0aGUgc29ja2V0IGlzIGFscmVhZHkgYmluZCBmb3IgdGhl
IHBvc3NpdGl2ZSB0ZXN0Cj4gYmVjYXVzZSB3ZSBubyBsb25nZXIgY2xvc2UgdGhlIHNvY2tldCBh
ZnRlciBlYWNoIGl0ZXJhdGlvbi4KCkV3LCBzb3JyeSBhYm91dCB0aGF0LiBJIGd1ZXNzIEkgbmV2
ZXIgcmFuIGl0IHdpdGggdGhlIG9wdGlvbiBhcyBJIG9ubHkgdHJpZWQKd2hhdCBpcyBsaXN0ZWQg
aW4gcnVudGVzdC4KCkknbGwgdHJ5IGl0IHdpdGggJy1pIDInLgoKPiBMb29raW5nIGF0Cj4gdGhl
IGJpbmQgdGVzdHMgd2Ugc2hvdWxkIG1vdmUgdGhpcyBvbmUgaW50byBhIHNlcGFyYXRlIHRlc3Rj
YXNlIGFuZCBhZGQKPiBhIGZldyBtb3JlIHBvc2l0aXZlIHRlc3RzIGFzIHdlbGwgd2Ugc2VlbSB0
byB0ZXN0IG9ubHkgQUZfSU5FVCwKPiBTT0NLX1NUUkVBTSBjb21iaW5hdGlvbiB3aGljaCBkb2Vz
IG5vdCBldmVuIGNvdmVyIGlwdjQgbm9yIHdlIGF0dGVtcCB0bwo+IGNvbm5lY3QgdG8gdGhlIHNv
Y2tldCB0aGF0IGhhdmUgYmVlbiBiaW5kLgoKQWdyZWUsIGFkZGVkIHRvIG15IHRvLWRvIGxpc3Qu
IEkgYW0gbW9zdGx5IGJ1cm5pbmcgdGhyb3VnaCB0ZXN0cyBhbmQKY29udmVydGluZyB0aGVtIHRv
IHRoZSBuZXcgbGlicmFyeSBtYW51YWxseS4KCj4gCj4gPiArLy8gU1BEWC1MaWNlbnNlLUlkZW50
aWZpZXI6IEdQTC0yLjAKPiAKPiBDaGFuZ2VkIHRoaXMgdG8gR1BMLTIuMC1vci1sYXRlciB0byBt
YXRjaCB0aGUgb3JpZ2luYWwgbGljZW5zZS4KCkkgdGhvdWdodCB0aGUgb3JpZ2luYWwgd2FzIEdQ
TC0yLjAgKG1heSBiZSBJIG1pc3JlYWQgdGhlIHRleHQsIHNvcnJ5KS4KCj4gCj4gQW5kIHJlbW92
ZWQgdGhlIE5VTEwgcGFyYW1ldGVyIGZyb20gdGhlIFRTVF9HRVRfVU5VU0VEX1BPUlQoKSwgc2lu
Y2UKPiBuZXdsaWIgdmFyaWFudCBkb2VzIG5vdCBoYXZlIHRoZSBjbGVhbnVwIGNhbGxiYWNrIHBh
cmFtZXRlci4KCkFjaywgdGhhbmtzIGZvciBkb2luZyB0aGlzIEN5cmlsLiBIb3BlZnVsbHkgdGhl
IG5leHQgb25lcyB3aWxsIGFwcGx5IHdpdGhvdXQKZWRpdHMgOzApCgotIHNzcAoKLS0gCk1haWxp
bmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
