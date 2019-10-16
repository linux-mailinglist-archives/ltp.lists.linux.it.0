Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id A81C9D8B85
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:42:30 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 6C23F3C220D
	for <lists+linux-ltp@lfdr.de>; Wed, 16 Oct 2019 10:42:30 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it [217.194.8.4])
 by picard.linux.it (Postfix) with ESMTP id F3B0B3C1CB4
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:42:28 +0200 (CEST)
Received: from mail.jv-coder.de (mail.jv-coder.de [5.9.79.73])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id 3F4D410007CD
 for <ltp@lists.linux.it>; Wed, 16 Oct 2019 10:42:27 +0200 (CEST)
Received: from [10.61.40.7] (unknown [37.156.92.209])
 by mail.jv-coder.de (Postfix) with ESMTPSA id 20C1F9F64C;
 Wed, 16 Oct 2019 08:42:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jv-coder.de; s=dkim;
 t=1571215347; bh=LA56bkfBWwyMAVoL0fIcRDsGr0ZBRGNgo4RaOQ63idc=;
 h=Subject:To:From:Message-ID:Date:MIME-Version;
 b=Sf4lujQ7TLjmqhGDsC7FcI6E0OVniLDSgqVALJdKPbFZD3L0HgYNd7QGP3wG99Iun
 XzhGL9b9tSg14yBMye7bmCVJU8mKUCgX3UUg6QoZu7wedAcNLeC2j6hbTwYGLZ2PRc
 j5DR1RoQTaNFl4rZBRWe9PnpGm4cARfqZhTaLqcM=
To: Jan Stancek <jstancek@redhat.com>
References: <20191011053134.18416-1-lkml@jv-coder.de>
 <2097000229.6302768.1571152116580.JavaMail.zimbra@redhat.com>
 <3c5988d6-0e37-6ca8-2567-a98d2ff84dce@jv-coder.de>
 <20191016083822.GA11593@dustball.usersys.redhat.com>
From: Joerg Vehlow <lkml@jv-coder.de>
Message-ID: <77c71c80-0ca2-6f67-d628-d337a13539d7@jv-coder.de>
Date: Wed, 16 Oct 2019 10:42:26 +0200
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.1.2
MIME-Version: 1.0
In-Reply-To: <20191016083822.GA11593@dustball.usersys.redhat.com>
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
Subject: Re: [LTP] [PATCH] open_posix/timer_getoverrun/2-3: Fix test for
 systems with low timer precision
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

Cj4gSSBkaWRuJ3QgY2hhbmdlIHRpbWVyIHJlc29sdXRpb24sIEkgb25seSB1c2VkIGxhcmdlciBp
bnRlcnZhbCB2YWx1ZXMKPiBhcyBtdWx0aXBsZSBvZiB0aW1lciByZXNvbHV0aW9uOgo+IMKgIGlu
dGVydmFsbnNlYyA9IGxhcmdlWCAqIHRpbWVyX3Jlc29sdXRpb24KPgphaCBvawo+IEknZCBwcmVm
ZXIgd2UgdHdlYWsgdGhlIHRvbGVyYW5jZSByYXRoZXIgdGhhbiBtYWtlIHRlc3QgcnVuIGxvbmdl
ci4KPiBJJ20gdGhpbmtpbmcganVzdCBhbGxvdyB+NTBtcyBvZiBleHRyYSBvdmVycnVucywgYW5k
IGRvbid0IGJlIHNvCj4gc3RyaWN0IGFib3V0IGFic29sdXRlIG51bWJlciBvZiBvdmVycnVucy4g
KEtWTSBndWVzdHMgYW5kIHMzOTAgbHBhcnMKPiB0ZW5kIHRvIHN1ZmZlciBmcm9tIGhpZ2hlciBz
dGVhbCB0aW1lKS4KPgo+IGRpZmYgLS1naXQgCj4gYS90ZXN0Y2FzZXMvb3Blbl9wb3NpeF90ZXN0
c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy90aW1lcl9nZXRvdmVycnVuLzItMy5jIAo+IGIv
dGVzdGNhc2VzL29wZW5fcG9zaXhfdGVzdHN1aXRlL2NvbmZvcm1hbmNlL2ludGVyZmFjZXMvdGlt
ZXJfZ2V0b3ZlcnJ1bi8yLTMuYyAKPgo+IGluZGV4IDk2YjdkMDFlNmZmZS4uNjZmOGI1ODNhNWE2
IDEwMDY0NAo+IC0tLSAKPiBhL3Rlc3RjYXNlcy9vcGVuX3Bvc2l4X3Rlc3RzdWl0ZS9jb25mb3Jt
YW5jZS9pbnRlcmZhY2VzL3RpbWVyX2dldG92ZXJydW4vMi0zLmMKPiArKysgCj4gYi90ZXN0Y2Fz
ZXMvb3Blbl9wb3NpeF90ZXN0c3VpdGUvY29uZm9ybWFuY2UvaW50ZXJmYWNlcy90aW1lcl9nZXRv
dmVycnVuLzItMy5jCj4gQEAgLTk0LDExICs5NCwxNyBAQCBpbnQgbWFpbih2b2lkKQo+Cj4gwqDC
oMKgwqDCoMKgwqAgdmFsdWVuc2VjID0gdHNyZXMudHZfbnNlYzsKPiDCoMKgwqDCoMKgwqDCoCBp
bnRlcnZhbG5zZWMgPSAyICogdmFsdWVuc2VjOwo+IC3CoMKgwqDCoMKgwqAgLy9leHBlY3RlZG92
ZXJydW5zID0gKDEwMDAwMDAwMDAgLSB2YWx1ZW5zZWMpIC8gaW50ZXJ2YWxuc2VjOwo+IMKgwqDC
oMKgwqDCoMKgIGV4cGVjdGVkb3ZlcnJ1bnMgPSAxMDAwMDAwMDAwIC8gaW50ZXJ2YWxuc2VjIC0g
MTsKPgo+ICvCoMKgwqDCoMKgwqAgLyoKPiArwqDCoMKgwqDCoMKgwqAgKiB3YWtpbmcgdXAgZnJv
bSBzbGVlcCBpc24ndCBpbnN0YW50LCB3ZSBjYW4gb3ZlcnNob290Lgo+ICvCoMKgwqDCoMKgwqDC
oCAqIEFsbG93IHVwIHRvIH41MG1zIHdvcnRoIG9mIGV4dHJhIG92ZXJydW5zLgo+ICvCoMKgwqDC
oMKgwqDCoCAqLwo+ICvCoMKgwqDCoMKgwqAgZnVkZ2UgPSA1MDAwMDAwMCAvIGludGVydmFsbnNl
YyArIDE7Cj4gKwo+IMKgwqDCoMKgwqDCoMKgIHByaW50ZigidmFsdWUgPSAlZCBzZWMsIGludGVy
dmFsID0gJWQgbnNlYywgIgo+IC3CoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoCAiZXhwZWN0ZWQg
b3ZlcnJ1bnMgPSAlZFxuIiwgMSwgaW50ZXJ2YWxuc2VjLCAKPiBleHBlY3RlZG92ZXJydW5zKTsK
PiArwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgImV4cGVjdGVkIG92ZXJydW5zID0gJWQsIGZ1
ZGdlID0gJWRcbiIsIDEsCj4gK8KgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIGludGVydmFsbnNl
YywgZXhwZWN0ZWRvdmVycnVucywgZnVkZ2UpOwo+Cj4gwqDCoMKgwqDCoMKgwqAgaXRzLml0X2lu
dGVydmFsLnR2X3NlYyA9IDA7Cj4gwqDCoMKgwqDCoMKgwqAgaXRzLml0X2ludGVydmFsLnR2X25z
ZWMgPSBpbnRlcnZhbG5zZWM7Cj4gQEAgLTE0Niw3ICsxNTIsNiBAQCBpbnQgbWFpbih2b2lkKQo+
IMKgwqDCoMKgwqDCoMKgwqAgKiBleHRyYSBleHBpcmllcyBhZnRlciB0aGUgbmFub3NsZWVwIGNv
bXBsZXRlcyBzbyBkbwo+IMKgwqDCoMKgwqDCoMKgwqAgKiBhIHJhbmdlIGNoZWNrLgo+IMKgwqDC
oMKgwqDCoMKgwqAgKi8KPiAtwqDCoMKgwqDCoMKgIGZ1ZGdlID0gZXhwZWN0ZWRvdmVycnVucyAv
IDEwMDsKPiDCoMKgwqDCoMKgwqDCoCBpZiAob3ZlcnJ1bnMgPj0gZXhwZWN0ZWRvdmVycnVucyAm
JiBvdmVycnVucyA8IAo+IGV4cGVjdGVkb3ZlcnJ1bnMgKyBmdWRnZSkgewo+IMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCBwcmludGYoIlRlc3QgUEFTU0VEXG4iKTsKPiDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqAgcmV0dXJuIFBUU19QQVNTOwo+Ckkgd29uZGVyIGlmIHRoZXJl
IHdhcyBhIHdheSB0byBkbyB0aGlzIG1vcmUgYWNjdXJhdGUsIGxpa2UgYnVzeSB3YWl0aW5nIAp3
aGlsZSBzaWduYWxzCmFyZSBibG9ja2VkLiBCdXQgSSB3b3VsZCBhbHNvIGJlIGZpbmUgd2l0aCB5
b3VyIHNvbHV0aW9uLgoKCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51
eC5pdC9saXN0aW5mby9sdHAK
