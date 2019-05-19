Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E3562294E
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 00:21:46 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 38A12294BD5
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 00:21:46 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id A2DF73EA241
 for <ltp@lists.linux.it>; Mon, 20 May 2019 00:21:42 +0200 (CEST)
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id D55CB1A00E0E
 for <ltp@lists.linux.it>; Mon, 20 May 2019 00:21:41 +0200 (CEST)
Received: by mail-pl1-x642.google.com with SMTP id g9so5772075plm.6
 for <ltp@lists.linux.it>; Sun, 19 May 2019 15:21:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=DXMmn90euAPlC2OhGkHZO7CiagNr8MXW6obYnF5gMGM=;
 b=SJd4vOTA+ghWG60iVbx+ZdmALI/F+XW3j6PTIRXWy1CcSjqy6n+a5Ho9PopzGvBB22
 vDhJ+1c9KGi6YHgeML5Wnsc43Ge57hMuptOACPnAlOBlZn3Yb3Rt+Lb4LPC/1sxuZLMH
 sgPBaVSWrIy/5ffWpe6rgjFpAwSX/FVoHD+THn0DGK7tWI/GEcPxD3uN6HPO8SdwOWfg
 G8zimO6c9E8dufVFy3EjRwQIYD/iwTyXIheVYhEEId9MMoDxhSq1uqwLEQXSuy5UbJct
 wUZReulCm93FjWBJdLJfs76EQEua6pah09/l//eJGWDJ6SK/PEO/ztGQk5pznzdQ11dO
 q4YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=DXMmn90euAPlC2OhGkHZO7CiagNr8MXW6obYnF5gMGM=;
 b=dJ/PM234vv2RMFcrvW/CTgp25Z7LBUfAsSAwSOYOnbLwqCSHnY9+XXr1qafnSsv6wb
 BrbItGp3VOwM0JHnZfymruPvvQfzJkk8vZSwRmAReOijvTI4VYOTobV5lJnL7+dv68rT
 YTe8H8v4Gw1SV+FaxcHNuUQubD6JTkzy4Z0617AB8Xsy5m1tkaecCkmNnsvT9met196A
 SCNJwjmoF2taMOT6Dde1j9p/OMIYUcjY5c5jHoe6Wz3V2PmkJMcCZMw1j7/K5f0MXC1P
 +9R8/u6cNJpD+V+h4vYsiXITl7wt4s3KszH2ime0oPoDY/m4MO8zYycdxoNoqawVcAK6
 aXGg==
X-Gm-Message-State: APjAAAUQSVAQxxvKsieCvatYx09M00mtIIvSu8NWHxPpj+X1mGgx9BXg
 8FxVH6DDAiyR3jkSDI2LaEg5bzoh7smVZw==
X-Google-Smtp-Source: APXvYqy+GdXFKhu1Es2dBrvybZFvf7YX48QBlhTI4h2m/PrLVPHGCQoCLNTX6Gbfut6G79MM7IFvAA==
X-Received: by 2002:a17:902:3383:: with SMTP id
 b3mr26333939plc.193.1558304500014; 
 Sun, 19 May 2019 15:21:40 -0700 (PDT)
Received: from localhost ([61.58.47.46])
 by smtp.gmail.com with ESMTPSA id c185sm18228008pfc.64.2019.05.19.15.21.39
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 19 May 2019 15:21:39 -0700 (PDT)
Date: Sun, 19 May 2019 15:21:38 -0700
From: Sandeep Patil <sspatil@android.com>
To: ltp@lists.linux.it
Message-ID: <20190519222138.GF209259@google.com>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-5-sspatil@android.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190519003808.47425-5-sspatil@android.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com
Subject: Re: [LTP] [PATCH 4/5] syscalls/bdflush01: delete bdflush test
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

T24gU2F0LCBNYXkgMTgsIDIwMTkgYXQgMDU6Mzg6MDdQTSAtMDcwMCwgU2FuZGVlcCBQYXRpbCB3
cm90ZToKPiBUaGUgbWFudWFsIHNheXMgdGhlIHN5c3RlbSBjYWxsIGlzIGRlcHJlY2F0ZWQgc2lu
Y2UgTGludXggMi42Cj4gYW5kIGRvZXMgbm90aGluZy4gU28sIHJlbW92ZSB0aGUgdGVzdC4KPiAK
PiBTaWduZWQtb2ZmLWJ5OiBTYW5kZWVwIFBhdGlsIDxzc3BhdGlsQGFuZHJvaWQuY29tPgo+IC0t
LQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvLmdpdGlnbm9yZSAgfCAgIDEg
LQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvTWFrZWZpbGUgICAgfCAgMjMg
LS0tLQo+ICB0ZXN0Y2FzZXMva2VybmVsL3N5c2NhbGxzL2JkZmx1c2gvYmRmbHVzaDAxLmMgfCAx
MjYgLS0tLS0tLS0tLS0tLS0tLS0tCj4gIDMgZmlsZXMgY2hhbmdlZCwgMTUwIGRlbGV0aW9ucygt
KQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5lbC9zeXNjYWxscy9iZGZsdXNo
Ly5naXRpZ25vcmUKPiAgZGVsZXRlIG1vZGUgMTAwNjQ0IHRlc3RjYXNlcy9rZXJuZWwvc3lzY2Fs
bHMvYmRmbHVzaC9NYWtlZmlsZQo+ICBkZWxldGUgbW9kZSAxMDA2NDQgdGVzdGNhc2VzL2tlcm5l
bC9zeXNjYWxscy9iZGZsdXNoL2JkZmx1c2gwMS5jCgpJdCBzZWVtcyBJJ3ZlIG1pc3NlZCByZW1v
dmluZyAnYmRmbHVzaDAxJyBmcm9tIHJ1bnRlc3QuIEkgd2lsbCBzZW5kIGEgdjIgd2l0aAp0aGF0
LCBpZiB5b3UgY2FuIGxvb2sgYXQgb3RoZXIgcGF0Y2hlcyBpbiB0aGUgbWVhbiB0aW1lLgoKLSBz
c3AKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
