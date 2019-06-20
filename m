Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 3111D4CFE8
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:04:42 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 07C2D298995
	for <lists+linux-ltp@lfdr.de>; Thu, 20 Jun 2019 16:04:42 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 197153EA931
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:04:39 +0200 (CEST)
Received: from mail-yb1-xb44.google.com (mail-yb1-xb44.google.com
 [IPv6:2607:f8b0:4864:20::b44])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id 7A3DC1A01143
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 16:04:38 +0200 (CEST)
Received: by mail-yb1-xb44.google.com with SMTP id x187so1262178ybc.11
 for <ltp@lists.linux.it>; Thu, 20 Jun 2019 07:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=G4lmLhAWABec9Dk/puC+1akcaNw+sLpABE9+WEasXGU=;
 b=OZUAI+4EYjcjqAzGK/KW7f6t9p03/ig5Ya7cOOEU5Vkcrk5PMLUrua0VnTbBtqoNu4
 6ZAzQk5g4xMY6lbl9Di6+sw83HMs194l8rqoaX2DIuRisXHoEONyv6vRwRNkl5Vmm4N/
 p98WzafVdOq2RcS3PlcsOuFplL4A0fBbqHMCigfO6MQZ8zLfeXCQnOhm4Rw0Al/oM5aQ
 F8w9ImKeB9/HejRKanZwBwxFzuXh+lDs9KPO6JtxR49bsXOQMi02GQZ+XlnasqWNyUr+
 r48nAvsckda3cnhb5FI7U9GsDbyzhDcYm1qEgYB05jpYG0tCl4ZXPBuV+mO5bmuu3zpK
 HSAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=G4lmLhAWABec9Dk/puC+1akcaNw+sLpABE9+WEasXGU=;
 b=Ep+GBuzESBPlQs03zg7+VmQJHSoLF6kJYiw++UAMfkK3K9V/gqvTnBAxmGMMelOoCN
 Vuv4szeDRpeF3UMPsFsuCIqo44SBcUSBjlo7Ze0U7c9P6YdiFGE/wDlpniyiOf0US9DV
 cRQk6kzjkDJL6bhSSzneS7jw/GBFA9l/qpDDgqFIr/OY7T3gpycEylF+cs6+Z4NBZnF8
 CxdmrZFbImA1eQODBfKQNLVx7lgloJlUOTjvMOwwuaidbmaDb4yUkx79ZJBz+R5zWpRX
 ZdbxqUitpBZ3a2zxb4byh3T2glldhS2BTXkAQfIEaJdGe5howq0Xbc+2NLUv6I0Pz1k5
 QQMQ==
X-Gm-Message-State: APjAAAUbVX1xvsoiGiT2HB+F+6gNpL4z4QazkttEdiY0TqbKMzcdXhGL
 wY+PrIFULFPRYsayblTqEW4+En168tdSOieWxiZlTg==
X-Google-Smtp-Source: APXvYqwujetKM9qE7RU1ba7NxBjSZzIC2g5uWlupC7sT0yb65qKb6F51ciZWDBKhYpDDrgOrFDxtT40RpKxhdnThphM=
X-Received: by 2002:a25:dc88:: with SMTP id y130mr15906641ybe.14.1561039477230; 
 Thu, 20 Jun 2019 07:04:37 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1561018312.git.mbobrowski@mbobrowski.org>
 <20190620132436.GA9804@dell5510>
 <CAOQ4uxjd8pvCpAHJ9Z9twY=EEvf9FNS3cycCZvHKhSN2JzY1Yw@mail.gmail.com>
In-Reply-To: <CAOQ4uxjd8pvCpAHJ9Z9twY=EEvf9FNS3cycCZvHKhSN2JzY1Yw@mail.gmail.com>
From: Amir Goldstein <amir73il@gmail.com>
Date: Thu, 20 Jun 2019 17:04:26 +0300
Message-ID: <CAOQ4uxhxXc4gpGzOJGAf4awLkPsE_nz8YUjJWeQk2fyy3NR+aw@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Cc: Jan Kara <jack@suse.cz>, LTP List <ltp@lists.linux.it>
Subject: Re: [LTP] [PATCH v5 0/4] syscalls/fanotify: FAN_REPORT_FID and
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

T24gVGh1LCBKdW4gMjAsIDIwMTkgYXQgNDo1NyBQTSBBbWlyIEdvbGRzdGVpbiA8YW1pcjczaWxA
Z21haWwuY29tPiB3cm90ZToKPgo+IE9uIFRodSwgSnVuIDIwLCAyMDE5IGF0IDQ6MjQgUE0gUGV0
ciBWb3JlbCA8cHZvcmVsQHN1c2UuY3o+IHdyb3RlOgo+ID4KPiA+IEhpIEFtaXIsIE1hdHRoZXcs
Cj4gPgo+ID4gTEdUTS4gSnVzdCBvbmUgb2YgdGhpcyBjb21taXRzIGZhaWxzIG9uIGNlbnRvcyA2
Cj4KPiBIaSBQZXRyLAo+Cj4gQ2FuIHlvdSBwbGVhc2UgdHJ5IGF0dGFjaGVkIHBhdGNoLgo+CgpX
YWl0LCBpdCdzIG5vdCBlbm91Z2guCkknbGwgcG9zdCBhIG5ldyBwYXRjaC4KClRoYW5rcywKQW1p
ci4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5m
by9sdHAK
