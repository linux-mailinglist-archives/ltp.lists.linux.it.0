Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E0BA3AC8F
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:27:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 542183EAE33
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:27:09 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::6])
 by picard.linux.it (Postfix) with ESMTP id C89EF3EADFD
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:26:39 +0200 (CEST)
Received: from mail-pg1-x541.google.com (mail-pg1-x541.google.com
 [IPv6:2607:f8b0:4864:20::541])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id D23571400528
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:26:38 +0200 (CEST)
Received: by mail-pg1-x541.google.com with SMTP id f25so4042160pgv.10
 for <ltp@lists.linux.it>; Sun, 09 Jun 2019 17:26:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=sEbEKYuOpDkV6HkCqWfLWnt6eG+gjbJWHHus43K2kUc=;
 b=JKU4iI0qwByEwKLWb5uNQ1d9875elbtgPDcL9xq5gRUf0toZDyRZWdPV4CknDyodch
 LpEcJxTCIRKIVnvlIWbc3mQBsnsNNP135P0O9bl8KmpSztV8XcB+yad869vNBY+9qxKc
 JGeFckLhpIzqN3r3/jbdOyaqm0LZHCq64PEToryth53mSL/mjLDlnz45c5Zn5hIQeivq
 91CJ4uDwHz9VjrC9gnTIrTBe2Xz91aa3Vas1Rc9/bmZeaHS7oa73uLdB4wGQXRL7rHS+
 FH3EIPysASLJEoTdenu/EyHQQb80hOkYy/Mrs5skVAgWW6eDGB9gShtkmwp9rZSEnTOx
 7aRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=sEbEKYuOpDkV6HkCqWfLWnt6eG+gjbJWHHus43K2kUc=;
 b=bjGFQt8t9XIWls1RPoqJ8NKNnK69QPJUXcTsu74GN5kPx9rI+W5Q7EQLpKNuDjLWZU
 W+F4RyijSzluWrFPjd0yyogluF9rHf5xPUEqZdbVpJBy2I6Fb0JfqsAHIY735FngGsQB
 tLD2pQ9PWP2bpnJGUWIBVLM6pmSJL41dIZKk52aFDPDl+GKeQ5c5/a8uCVZGfs6y55fU
 AIEp8XdkpNu4uzpiYXG/6a9Rsr+MDPeV5LvPcJC2X85XB6CzDZdBFfctZhML3wpkt8uJ
 ymXX92QrOEkaD35mV9CxjReB6Y8bt79C5EiDNDcx7HHsPfHHu9WkHxYKV10K7B3uJXMQ
 kgbg==
X-Gm-Message-State: APjAAAVnPdym3DirhfJhO0LeqxkNTXdBi3xL6zARbnUFMD7azjSV5QCI
 fpEXZLFHB2GgQd1tf7Ic/hiXbQ==
X-Google-Smtp-Source: APXvYqy3snal0/U4CcFh3T/0d/ieLLZ+5Oqj6/55LcbgLw6jq5LUBX7S46+JlcmzxB8/E31TAtXBnQ==
X-Received: by 2002:a63:eb03:: with SMTP id t3mr13628874pgh.315.1560126397439; 
 Sun, 09 Jun 2019 17:26:37 -0700 (PDT)
Received: from localhost (c-73-170-36-70.hsd1.ca.comcast.net. [73.170.36.70])
 by smtp.gmail.com with ESMTPSA id
 b26sm2888585pfo.129.2019.06.09.17.26.36
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 17:26:36 -0700 (PDT)
Date: Sun, 9 Jun 2019 17:26:36 -0700
From: Sandeep Patil <sspatil@android.com>
To: Cyril Hrubis <chrubis@suse.cz>
Message-ID: <20190610002636.GC212690@google.com>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-6-sspatil@android.com>
 <20190529115149.GA569@rei.lan>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190529115149.GA569@rei.lan>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
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
c2UgeW91ciBjb21taXQ/CgpEb25lLCB2MiBzZW50CgotLSAKTWFpbGluZyBsaXN0IGluZm86IGh0
dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
