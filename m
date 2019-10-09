Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D65E3D0DDF
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 13:43:40 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 5742B3C2266
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 13:43:40 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id B65393C203D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 13:43:36 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id F0A2D600FA0
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 13:42:17 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 06D319F679;
 Wed,  9 Oct 2019 11:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1570621415; bh=We5cKJQSPkXNMdGphwLDREMEcuvU4TebTpUT/kInm2Q=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=fhtsHxRiHAduDjFqNyOwAkZoMJ0qLV4lgTQa4Q3t8dKhLJm5nr9jDmXQZlbhB7YRt
 6TpljBCjsVmRYdzXHc+DtAXw8mrV7q6IHxEyKLMbu/AAGS3eQjYRBhq5kMNQpZwN5I
 CBFqujfU7whfrZG1Hi70Eb9X48dY3qzjrdIHirno=
To: Cyril Hrubis <chrubis@suse.cz>
References: <20191009061619.48677-1-lkml@jv-coder.de>
 <20191009061619.48677-3-lkml@jv-coder.de> <20191009113919.GB7561@rei.lan>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <64bb824c-d577-86e5-bfa5-17a8cfbf4174@jv-coder.de>
Date: Wed, 9 Oct 2019 13:43:34 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.1
MIME-Version: 1.0
In-Reply-To: <20191009113919.GB7561@rei.lan>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH 2/2] tst_test.sh: Add public tst_test_root command
X-BeenThere: ltp@lists.linux.it
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Linux Test Project <ltp.lists.linux.it>
List-Unsubscribe: <https://lists.linux.it/options/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=unsubscribe>
List-Archive: <http://lists.linux.it/pipermail/ltp/>
List-Post: <mailto:ltp@lists.linux.it>
List-Help: <mailto:ltp-request@lists.linux.it?subject=help>
List-Subscribe: <https://lists.linux.it/listinfo/ltp>,
 <mailto:ltp-request@lists.linux.it?subject=subscribe>
Cc: Joerg Vehlow <joerg.vehlow@aox-tech.de>, ltp@lists.linux.it
Content-Transfer-Encoding: base64
Content-Type: text/plain; charset="utf-8"; Format="flowed"
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGksCj4gQ2FuIHdlIGtlZXAgdGhlIG5hbWUgdG8gYmUgdHN0X3JlcXVpcmVfcm9vdCgpIHBsZWFz
ZT8KPgo+IEhpc3RvcmljYWxseSB0aGlzIGZ1bmN0aW9uIGhhcyBiZWVuIGFsd2F5cyBuYW1lZCBs
aWtlIHRoaXMgaW4gTFRQLgo+Ck5vdCBhIHZlcnkgZ29vZCBhcmd1bWVudCBmb3IgdHdvIHJlYXNv
bnM6CjEuIFRoZSBmdW5jdGlvbiB3YXMgaW50ZXJuYWwgdG8gdGhlIGxpYnJhcnksIHNvIG5vIG9u
ZSAoZXhjZXB0IGZvciAKbGlicmFyeSBkZXZlbG9wZXJzKQogwqDCoCBzaG91bGQga25vdyBhYm91
dCBpdCBhbnl3YXkuIFRoZSBvbGQgcHVibGljIGludGVyZmFjZSAKKFRTVF9ORUVEU19ST09UKSBp
cyB1bmNoYW5nZWQKMi4gSSB3YW50ZWQgdG8gbWFrZSBpdCBjb25zaXN0ZW50IHdpdGggb3RoZXIg
ZnVuY3Rpb25zLCB0aGF0IGRvIHNpbWlsYXIgCnN0dWZmIGxpa2UKIMKgwqAgdHN0X3Rlc3RfZHJp
dmVycyBhbmQgdHN0X3Rlc3RfY21kcy4gQm90aCBhbHNvIGNhbGwgdHN0X2JyayBpbiBjYXNlIApv
ZiB1bnN1Y2Nlc3NmdWwgdGVzdHMuCgpKw7ZyZwoKLS0gCk1haWxpbmcgbGlzdCBpbmZvOiBodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
