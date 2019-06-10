Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 81D053AC90
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:27:50 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 3BD853EADC0
	for <lists+linux-ltp@lfdr.de>; Mon, 10 Jun 2019 02:27:50 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-6.smtp.seeweb.it (in-6.smtp.seeweb.it [217.194.8.6])
 by picard.linux.it (Postfix) with ESMTP id 1BDAE3EA5CE
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:27:47 +0200 (CEST)
Received: from mail-pl1-x644.google.com (mail-pl1-x644.google.com
 [IPv6:2607:f8b0:4864:20::644])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-6.smtp.seeweb.it (Postfix) with ESMTPS id 6D9BF140052E
 for <ltp@lists.linux.it>; Mon, 10 Jun 2019 02:27:46 +0200 (CEST)
Received: by mail-pl1-x644.google.com with SMTP id bh12so2914512plb.4
 for <ltp@lists.linux.it>; Sun, 09 Jun 2019 17:27:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=android.com; s=20161025;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=CRRIYBmeG/PEcYu+ONB5CtGCV4LLapSDO3CcGINqW+A=;
 b=vMZFunWS/wTiC2u/bMgOwv6z53F3xSrB5IITntB6Ui4RiTuDRQrVtZo8aSdzYDRuLX
 ZAqrsRWxd1vV9Eyf9eoK8c7rAOvm9E0oztrBp4AeA5sK/I2+Kh3vJZAIk7flgPVr/Ykw
 ZnNGsv2ooq2alzRXE8DtP7m86VtkpM2rcBBqoCVXYOtkc6BrwxKncfpNWPjFUe0WavRk
 KGCv9ZbMfZmeFqX8UQcKcMt/UmXh/dbBQgYrA9EnSaDFGxGnj6OKWo60V6XHVavn0Nwo
 EkM0wS4DCoSncQ0N10TL/IX5E4Vd+jQEuRFPUXZ8WmMhApIrtXJCiX25wZmASD/6XdWf
 kUrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=CRRIYBmeG/PEcYu+ONB5CtGCV4LLapSDO3CcGINqW+A=;
 b=GrG7NvDvdx6NshP9Qq8hON7uonbtpHdtBC1IA2ENcy/EexF/EnAwAhV+bU9DGn5i/q
 N53X0rA9Ie4xKpdjqOc3KDapx7TW8f7WlX1mXh3SMSUO+9SLerbLAGUVEPfgrA9tbgvf
 zXmKYI6xz+4TZwg5phPrahoCHmE8H2bddSQwt0VGmLAiv7BPm1Uw/+mkEQaWd4AqpzN0
 C2Q2gUkNoTVYCAZMV+AZnNoIEgpSdAuI6LTMUhsGZHov+JK2vOSo8WGHxHCkq1V0X+UL
 R7kCIeQEEz0+oSfK+e4P7pIoSozC0vxm2uz4ivF5x8sSZU2B3Nqqspg4UCmpx7dCTs3r
 3hvA==
X-Gm-Message-State: APjAAAVMi8nMxIZoYarTPozyjn1YDLoy12o5oq4HWkRKGUbZWQ/hRYA4
 FtPHc/THLg7+Q3HQuCquJO/ZOK2nzAs=
X-Google-Smtp-Source: APXvYqzLg5ZnO8akiZyVJoUgfPpeLR/X5zQjBCYj5hGZXiFVJ2lhWFAE64yfD7/PdAtGKONr8/JIJQ==
X-Received: by 2002:a17:902:728b:: with SMTP id
 d11mr38306136pll.78.1560126465065; 
 Sun, 09 Jun 2019 17:27:45 -0700 (PDT)
Received: from localhost (c-73-170-36-70.hsd1.ca.comcast.net. [73.170.36.70])
 by smtp.gmail.com with ESMTPSA id
 l8sm8879200pgb.76.2019.06.09.17.27.44
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sun, 09 Jun 2019 17:27:44 -0700 (PDT)
Date: Sun, 9 Jun 2019 17:27:43 -0700
From: Sandeep Patil <sspatil@android.com>
To: Petr Vorel <pvorel@suse.cz>
Message-ID: <20190610002743.GD212690@google.com>
References: <20190519003808.47425-1-sspatil@android.com>
 <20190519003808.47425-4-sspatil@android.com>
 <20190529112529.GC26685@rei.lan> <20190603143137.GA18922@dell5510>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190603143137.GA18922@dell5510>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Virus-Scanned: clamav-milter 0.99.2 at in-6.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-6.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH 3/5] syscalls/asyncio02: convert to new library.
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

T24gTW9uLCBKdW4gMDMsIDIwMTkgYXQgMDQ6MzE6MzdQTSArMDIwMCwgUGV0ciBWb3JlbCB3cm90
ZToKPiBIaSwKPiAKPiA+IFRoZSBjbGVhbnVwIGxvb2tzIGdvb2QsIGJ1dCB3ZSBzaG91bGQgYWxz
byBkZWNpZGUgd2hhdCB0byBkbyB3aXRoIHRoZQo+ID4gdGVzdCBhcyBpdCBpcyBpbiBhIHdyb25n
IHBsYWNlLiBUaGVyZSBpcyBubyBhc3luY2lvIHN5c2NhbGwgaW4gTGludXggYW5kCj4gPiB0aGUg
dGVzdCBhY3R1YWxseSBsb29rcyB2ZXJ5IHNpbWlsYXIgdG8gdGhlIHN0YXQwMS5jIHRlc3QsIHNv
IG1heWJlIGl0Cj4gPiB3b3VsZCBiZSBiZXN0IHRvIHJlbmFtZSB0aGUgdGVzdCB0byBzdGF0MDIu
YyBhZnRlciB0aGUgY2xlYW51cC4gV2hhdCBkbwo+ID4geW91IHRoaW5rPwo+IEknZCBhbHNvIG1v
dmUgaXQgaW50byBzdGF0L3N0YXQwMi5jLgoKSSBkaWQgdGhpcyBub3cgYXMgcGFydCBvZiB2Mi4g
SG93ZXZlciwgdGhlIHRlc3QgaXMgc3RpbGwgc3VwZXIgdHJpdmlhbCBhbmQKaXNuJ3QgYXQgYWxs
IHVuaXF1ZS4gQWxsIGl0IGlzIG5vdyBpcyAidmVyaWZ5IHN0YXQgc2l6ZSIgYW5kIEkgdGhpbmsg
c3RhdDAxCmNvdmVycyBpdCB0b28uCgpBbnl3YXksIGl0cyB0aGVyZSBpbiB0aGUgbmV3IHNlcmll
cyBpZiB5b3Ugc3RpbGwgc2VlIHZhbHVlIGluIGhhdmluZyBhCnN0YXQwMi4KCi0gc3NwCgotLSAK
TWFpbGluZyBsaXN0IGluZm86IGh0dHBzOi8vbGlzdHMubGludXguaXQvbGlzdGluZm8vbHRwCg==
