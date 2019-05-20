Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB3623DC3
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 18:45:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 56DC92D0144
	for <lists+linux-ltp@lfdr.de>; Mon, 20 May 2019 18:45:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 0B7B03EA18F
 for <ltp@lists.linux.it>; Mon, 20 May 2019 18:45:30 +0200 (CEST)
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 511C91000CA5
 for <ltp@lists.linux.it>; Mon, 20 May 2019 18:45:26 +0200 (CEST)
Received: by mail-yb1-xb42.google.com with SMTP id a21so5932884ybg.9
 for <ltp@lists.linux.it>; Mon, 20 May 2019 09:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc; bh=etPCk/AjxodEm4JMCU7lqKlKeZVk1af5f4kcOzqWRF8=;
 b=X44tZLnOi+484l1Rzl2N7KURNF3h8GzuGFbPxSmVLCUMJ1dZ2dWu0j7bIOlK7vg8zS
 D0Cm7zYtW2febPb/ksB5JFHBKX58UZtY7LhiuqdSgtUluYErU5PC45t8EfzmClAkk4Qc
 xEyvp7EsSUphIe8C39kyxK7J1bdozeflBaT9ZbhOQcY/pm4XOFf1J2xR+4o6UeiIYyqN
 vvLGsLCPurzqpUB3G7u/0anbSenO5OCr/lApULLcoJ3WgYY+96jz8j38/IfwErUQ/WQR
 TqP3r+q/uzl0NGGTDM9dWvuVIfJ7HRVcJBusa7I6umwLu5EkCWN4FV58/0HI9Xskbp5H
 BmKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=etPCk/AjxodEm4JMCU7lqKlKeZVk1af5f4kcOzqWRF8=;
 b=VT9n4DQdTDs6RIki7wTH6ANyWWQwHv4wZhVSf/zOAs7brOkA4j9rCDqfPGHeZSZP5x
 T/vzdjKdsMPGn/dst9YIXbWYPhdPt7rZr8vYjpPq5li8tojKlcAKtjBN3MzdusOaids9
 2MRmaFCOymLUrfUxNTWgbfvTAhh+LOtNr7oT0M5XPcdkXeqLkl0L9Kaw/VtF+SU3mXIK
 7QiCZcr7/XsA9UN2Dv0Ze9I0ofIN279SB2BttlMqOjCcN4nZ08DeMdaserhD4leOGTV7
 zz5GAOn9myQjm3jV8FoSGyKRVj0sBlqMjYB/86OoRZx1ROsSiDTlidxhi9G54zdqwFH9
 gMdw==
X-Gm-Message-State: APjAAAVo3zIEk+u4++3YuKhBIb4WXMf8j6M3AisSLy3aBlVJtgVWfsez
 c3rf9LV4m35nj1U9uauGViPmKxFXivxQs7r2gA4=
X-Google-Smtp-Source: APXvYqyrIF8gIK75hGxApAQrI11WpiqM0ipdT36EticupRV8PZ1a58lNfqhIN9OLT78gZS2OYbg9oYoTPxR3cDNFCNw=
X-Received: by 2002:a25:cb0c:: with SMTP id b12mr12496862ybg.144.1558370728292; 
 Mon, 20 May 2019 09:45:28 -0700 (PDT)
MIME-Version: 1.0
References: <20190506105457.22350-1-camann@suse.com>
 <1ef7d8ee-ae31-b44c-71e6-7d09da55eda2@suse.com>
 <20190506201948.GA9828@dell5510> <20190520143135.GA27341@dell5510>
 <20190520144645.GD28976@rei.lan> <20190520152400.GA11845@dell5510>
In-Reply-To: <20190520152400.GA11845@dell5510>
From: Amir Goldstein <amir73il@gmail.com>
Date: Mon, 20 May 2019 19:45:16 +0300
Message-ID: <CAOQ4uxivgpoMeUUxm-fboFfiXLXn+QXNzKJWSHAZhidwUsuvng@mail.gmail.com>
To: Petr Vorel <pvorel@suse.cz>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,FREEMAIL_FROM,SPF_HELO_NONE,SPF_PASS autolearn=disabled
 version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v4] syscalls/copy_file_range: add/restructured
	tests
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

T24gTW9uLCBNYXkgMjAsIDIwMTkgYXQgNjoyNCBQTSBQZXRyIFZvcmVsIDxwdm9yZWxAc3VzZS5j
ej4gd3JvdGU6Cj4KPiBIaSwKPgo+ID4gPiAyKSBHbGliYyBhZGRzIGludGVybmFsIGltcGxlbWVu
dGF0aW9uIG9mIGNvcHlfZmlsZV9yYW5nZSgpLCB1c2VkIGFzIGZhbGxiYWNrCj4gPiA+IHdoZW4g
a2VybmVsIDwgNC41ICh3aGljaCBicm91Z2h0IGNvcHlfZmlsZV9yYW5nZSgpKSBbMV0uIEkgZ3Vl
c3MgdGhlcmUgaXMgbm8gd2F5Cj4gPiA+IHRvIHVzZSBpdCBleHBsaWNpdGx5IDooLgo+Cj4gPiBX
ZWxsIHdlIGNhbiBhbHdheXMgdXNlIGZpbGVzeXN0ZW0gdGhhdCBkb2VzIG5vdCBzdXBwb3J0IHRo
ZSBvcGVyYXRpb24sCj4gPiBzbyBydW5uaW5nIHRoZSB0ZXN0IGZvciBhbGwgZmlsZXN5c3RlbXMg
c2hvdWxkIGdldCB0aGUgZW11bGF0aW9uIGNvdmVyZWQKPiA+IGZvciBzdXJlLi4uCj4gT2gsIHRo
YXQncyB0aGUgd2F5IDopLgoKQWN0dWFsbHksIHRoZXJlIGlzIG5vIHN1Y2ggdGhpbmcgYXMgZmls
ZXN5c3RlbSB0aGF0IGRvZXMgbm90IHN1cHBvcnQKY29weV9maWxlX3JhbmdlKCkgYmVjYXVzZSB0
aGUga2VybmVsIHByb3ZpZGVzIGEgZmFsbGJhY2sgZGVmYXVsdCBpbXBsZW1lbnRhdGlvbgooaW4t
a2VybmVsIGNvcHkpLgoKPiBNZXJnZWQgdGhlbiwgdGhhbmtzIGZvciB5b3VyIHBhdGNoLCBDaHJp
c3RpYW4uCj4KCkkgd2FzIGdvaW5nIHRvIGFzayB0aGF0IHlvdSBkcm9wIHRoZSBFWERFViB0ZXN0
LCBiZWNhdXNlIEkgYW0gd29ya2luZyBvbiBhIHBhdGgKc2V0IHRvIHJlbGF4IHRoZSBjcm9zcy1k
ZXZpY2UgY29uc3RyYWludC4KT2ggd2VsbC4gSSB3aWxsIHBvc3QgYSBwYXRjaCB0byByZW1vdmUg
dGhhdCB0ZXN0IGNhc2Ugb25jZSBteSBjb2RlIGlzIG1lcmdlZC4KClRoYW5rcywKQW1pci4KCi0t
IApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
