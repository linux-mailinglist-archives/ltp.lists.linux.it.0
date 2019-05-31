Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 566F7313AD
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 19:20:04 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 123A3390299
	for <lists+linux-ltp@lfdr.de>; Fri, 31 May 2019 19:20:04 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it [217.194.8.7])
 by picard.linux.it (Postfix) with ESMTP id E9BE13EA19D
 for <ltp@lists.linux.it>; Fri, 31 May 2019 19:19:59 +0200 (CEST)
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id DFD8D20032D
 for <ltp@lists.linux.it>; Fri, 31 May 2019 19:19:58 +0200 (CEST)
Received: by mail-pg1-x544.google.com with SMTP id f25so4387238pgv.10
 for <ltp@lists.linux.it>; Fri, 31 May 2019 10:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=81v2u2TLoFXq7ooFEFXryYz9xGg004OugQahEBvEYgw=;
 b=KD5er2eqrmPKaJmTQq+oecz4LqBx6kjqJwmOCcE3pd+OiU1YK5qyIdMIqF5nvi7CDe
 81oYV//3NG5bF4Q0vcTwPnAlAKPSsBzmpMAEK2g8x1xVL3hf6s7lMLuxbyo+rUKIpGeb
 LirNv/BrPiq6xYKgmkYE0853AGkyFrfFBF2AOxui5MbRe8SEb5RWOPpvRcJ4bBteuBgh
 rSCTvlA5NBGplVl5Ok0TJBUVut39QLQSKCg+QILHTPS9+TUUffYNS9E0mWLR0Brbn3HB
 OVFpcOrdTMfywX9AwqOVrENeWbGnfZM5bB5QirLF+CkSg0g7Uz1pMLVuuv+8mXDvCK0s
 C++w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=81v2u2TLoFXq7ooFEFXryYz9xGg004OugQahEBvEYgw=;
 b=t9Ep4Kq0M3DR7/g6daAGnEyPr5RN2ss0muFvD7YTKC2e6e5j9ZD9XISZGK4bebjxGv
 DAFwqmsO/WKDuEiJs9Ko23Cbs4yqb633uWP+Sx+cykoAhV91qfpP2dUFJly1qgL0rdOQ
 qZ1uzoXevwi6TDJZgx06S31bVFL4Fi3O90XyF2y3J0M+z4IIgX75sLpexJvIUt6jUJEa
 krFKE9Aol/7Hm16sFqpNbQ9FJSeJ8rH6Q8rLmOV20+jYMgaPpdxtOLUqTUNyAB+WK1lw
 tZJMYaK7V0thz4y9D9iaeBy3UVU3mvod+ssK7hq4JWH2+V2LQmDQN6FICon8CBqQUWsm
 buKg==
X-Gm-Message-State: APjAAAXdn9X1wbx+DYlUJL05tNyUgQ1gaRUq/f8z2x4nRoCEy73s0EJa
 4gaXFGEbvQR1l+FgjGIydNQOXg==
X-Google-Smtp-Source: APXvYqxyhC6X6uC54/yI47Niaf5dwIqIH4r6K9l16U39hsg8KQ5glXjmKF9jwXlvxDLQwKFLm4B08A==
X-Received: by 2002:a17:90a:6505:: with SMTP id
 i5mr8947586pjj.13.1559323197333; 
 Fri, 31 May 2019 10:19:57 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3fed:2d30:9d40:70a3])
 by smtp.gmail.com with ESMTPSA id j7sm648245pgp.88.2019.05.31.10.19.56
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Fri, 31 May 2019 10:19:56 -0700 (PDT)
Date: Fri, 31 May 2019 10:19:55 -0700
From: Sandeep Patil <sspatil@android.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190531171955.GB203031@google.com>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-6-sspatil@android.com>
 <20190529115149.GA569@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529115149.GA569@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-7.smtp.seeweb.it
Cc: chrubis@suze.cz, kernel-team@android.com, ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 5/5] syscalls/bind01: convert to new library.
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

T24gV2VkLCBNYXkgMjksIDIwMTkgYXQgMDE6NTE6NDlQTSArMDIwMCwgQ3lyaWwgSHJ1YmlzIHdy
b3RlOgo+IEhpIQo+IFVuZm9ydHVuYXRlbGx5IHRoaXMgZG9lcyBub3QgYXBwbHkgY2xlYW5seSBh
ZnRlcjoKPiAKPiBjb21taXQgZmE2YTRlNzA4NDk1ZDkxNzdlY2EzOTU3MTdlYmFiNGVlOWFmZDhk
Ngo+IEF1dGhvcjogUGV0ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+Cj4gRGF0ZTogICBUdWUgQXBy
IDIzIDIxOjM4OjIzIDIwMTkgKzAyMDAKPiAKPiAgICAgbmV0OiBJbnRyb2R1Y2UgVFNUX0dFVF9V
TlVTRURfUE9SVCgpIG1hY3JvIGludG8gQyBBUEkKPiAKPiAKPiBDYW4geW91IHBsZWFzZSByZWJh
c2UgeW91ciBjb21taXQ/CgpXaWxsIGRvIGFuZCByZXNlbmQgdGhlIHNlcmllcyBhZGRyZXNzaW5n
IHlvdXIgY29tbWVudHMgb24gb3RoZXIgcGF0Y2hlcy4KClRoYW5rcyBmb3IgcmV2aWV3aW5nLAot
IHNzcAoKPiAKPiAtLSAKPiBDeXJpbCBIcnViaXMKPiBjaHJ1YmlzQHN1c2UuY3oKCi0tIApNYWls
aW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
