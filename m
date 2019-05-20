Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 483EC23155
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 12:30:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 1DA282987A6
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 12:30:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it [217.194.8.2])
 by picard.linux.it (Postfix) with ESMTP id 793E1298784
 for <ltp@lists.linux.it>; Mon, 20 May 2019 12:30:40 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 991B8600680
 for <ltp@lists.linux.it>; Mon, 20 May 2019 12:30:39 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id t62so5463699ybi.11
 for <ltp@lists.linux.it>; Mon, 20 May 2019 03:30:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=qWnbBLtlm1HljKFvpmJw5DALgDP4qU1IIUaekHxeOjM=;
 b=Gh0SfodtdvJwjtxCQ+8osZcOSw1RLx1mEVEFCHQvzXRd4Dw3T4B8S8dGAb//+9vjKi
 qJ8BsouBNsOsT8qIXy9fMHRfTedLvJ6VYWa03clfwfVCDkKWhq5HCwslKeDVmW4gc5yY
 pr/0wi21lnVGWUiKhA1f6h+vmqo0fPkvv3Sj3tetoTOziape0xr5vCG43VkxL966b6eD
 kLE9zqu1CyDY/C8Whp1YDIQ7BbbT02fwPF5rFRqnVJjXXgILbNDE8UOXK3QkN5KyFZ8N
 bnAz2Fmo2AkzVgBCFmrUVxynv9r9m1MLkfvbU+mMpMbMZuvLZeOeSJ0lF+D9B5khUtGX
 CREQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=qWnbBLtlm1HljKFvpmJw5DALgDP4qU1IIUaekHxeOjM=;
 b=Lhc/8tmMNoGhZUEcvKLplGA0YCv6hJswMcAx72FqNBz6GEcFyvdcMwm5LKPc3/vsuX
 esZ3KK7NW4xBCrJq00OeSPwSn4a6I9ja/Nj6KUN7hDopItbgPh/UYOXHLm9Ls5KlxbFz
 O0FE3pY3g+7anIx1TqqBfgiVi17/3Av9dd1Hx8hwS5X4R6936TeXp0NDDEpKbiA08H6D
 bNSPcd7O/QZMevi3J2vbqBnnN2tDlhepj/AlsEUwgsEgaKHF4NxMZM4bPAiELL+dy7xg
 8VHRq9SH8tXypIKzMAcIZg/feIMviyPgjNKS8+6EdLA4US8h2C1cVvzg/hs2M+UNe6v3
 m8Dg==
X-Gm-Message-State: APjAAAUIYgUdFiwZTucUyMN7PiEB61aYifN1Lx2MldNzagLqWD0Od/M3
 Eq1MiPL0AqFK+L40y59Rag8YAfHK1qndKrJqg38oo+Nb
X-Google-Smtp-Source: APXvYqxDK6cv4w5TAmWRF6SIliR8PkEySXLP2ILRSO9e3B6OIVMA5rQw6vDiymfuLkEMd/5UIpTd4DPAUAvOx7qBC1k=
X-Received: by 2002:a25:7a41:: with SMTP id v62mr12245968ybc.14.1558348238412; 
 Mon, 20 May 2019 03:30:38 -0700 (PDT)
MIME-Version: 1.0
References: <20190404141611.15192-1-chrubis@suse.cz>
 <20190520100824.GA25813@rei.lan>
In-Reply-To: <20190520100824.GA25813@rei.lan>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 20 May 2019 13:30:27 +0300
Message-ID: <CAOQ4uxgNGK=QcGcmDpjt0jhWC9=E3egSpv5G0-7tXx7bKQD7gw@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-2.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2] syscalls/preadv203: Add basic RWF_NOWAIT test
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

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgMTowOCBQTSBDeXJpbCBIcnViaXMgPGNocnViaXNAc3Vz
ZS5jej4gd3JvdGU6Cj4KPiBIaSEKPiBQaW5nLCBhbnlib2R5IGhhcyBhbnkgY29tbWVudHMgb3Ig
Y2FuIGJlIHRoaXMgYmUgdGhpcyBtZXJnZWQ/Cj4KCkkgaGF2ZSBubyBvYmplY3Rpb24gdG8gdGhp
cyB0ZXN0LCBidXQgSSBoYXZlIGEgcXVlc3Rpb24uIFlvdXIgY2xhaW0gaXM6CiJXZSBhcmUgYXR0
ZW1wdGluZyB0byB0cmlnZ2VyIHRoZSBFQUdBSU4gcGF0aCBmb3IgdGhlIFJXRl9OT1dBSVQgZmxh
Zy4iCgpTZWVtcyBsaWtlIHlvdSBoYXZlIGdvbmUgdG8gYSBncmVhdCBsZW5ndGggb2YgZWZmb3J0
IHRvIGFjaGlldmUgdGhpcy4KV291bGRuJ3QgaXQgYmUgc3VmZmljaWVudCB0byBkbyBhIHNpbmds
ZSBwcmVhZHYyIGFmdGVyIGZzeW5jK2Ryb3BfY2FjaGVzIGluCm9yZGVyIHRvIG9ic2VydmUgRUFH
QUlOPwoKVGhlcmUgYXJlIHNldmVyYWwgb3RoZXIgd2F5cyB0byBnZXQgRUFHQUlOLCBsaWtlIERJ
TyByZWFkL3dyaXRlIHdoZW4KcGFnZSBjYWNoZSAqaXMqIHBvcHVsYXRlZC4KClF1ZXN0aW9uIGlz
LCBob3cgbXVjaCBpcyB0aGUgdGVzdCB0cnlpbmcgdG8gY292ZXIuCgpUaGFua3MsCkFtaXIuCgot
LSAKTWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRw
Cg==
