Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5951D3768A4
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 18:25:02 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 01A813C8D28
	for <lists+linux-ltp@lfdr.de>; Fri,  7 May 2021 18:25:02 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-7.smtp.seeweb.it (in-7.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::7])
 (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits))
 (No client certificate requested)
 by picard.linux.it (Postfix) with ESMTPS id A98263C55FE
 for <ltp@lists.linux.it>; Fri,  7 May 2021 18:25:00 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-7.smtp.seeweb.it (Postfix) with ESMTPS id 16CD32000EC
 for <ltp@lists.linux.it>; Fri,  7 May 2021 18:24:59 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 41ABDB022;
 Fri,  7 May 2021 16:24:59 +0000 (UTC)
Date: Fri, 7 May 2021 18:24:57 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Zhao Gongyi <zhaogongyi@huawei.com>
Message-ID: <YJVp2SHmyvRsDSNs@pevik>
References: <20210506093201.3129-1-zhaogongyi@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20210506093201.3129-1-zhaogongyi@huawei.com>
X-Virus-Scanned: clamav-milter 0.102.4 at in-7.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-7.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] syscalls/unlinkat01: Bugfix and update to new
 API
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
Reply-To: Petr Vorel <pvorel@suse.cz>
Cc: ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgWmhhbywKCj4gK3N0YXRpYyBzdHJ1Y3QgdGNhc2Ugewo+ICsJaW50IGZkOwo+ICsJY2hhciAq
ZmlsZW5hbWU7CkZZSSB0aGlzIHJlcXVpcmVkIGFkZGluZyBjb25zdDoKCnVubGlua2F0MDEuYzo0
MzoxMzogd2FybmluZzogaW5pdGlhbGl6YXRpb24gZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlm
aWVyIGZyb20gcG9pbnRlciB0YXJnZXQgdHlwZSBbLVdkaXNjYXJkZWQtcXVhbGlmaWVyc10KICAg
NDMgfCAgICAgICAgIHswLCB0ZXN0ZmlsZSwgMCwgMH0sCiAgICAgIHwgICAgICAgICAgICAgXn5+
fn5+fn4KdW5saW5rYXQwMS5jOjQ1OjEzOiB3YXJuaW5nOiBpbml0aWFsaXphdGlvbiBkaXNjYXJk
cyDigJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Rpc2Nh
cmRlZC1xdWFsaWZpZXJzXQogICA0NSB8ICAgICAgICAgezAsIHRlc3RmaWxlLCAwLCBFTk9URElS
fSwKICAgICAgfCAgICAgICAgICAgICBefn5+fn5+fgp1bmxpbmthdDAxLmM6NDY6MTU6IHdhcm5p
bmc6IGluaXRpYWxpemF0aW9uIGRpc2NhcmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBv
aW50ZXIgdGFyZ2V0IHR5cGUgWy1XZGlzY2FyZGVkLXF1YWxpZmllcnNdCiAgIDQ2IHwgICAgICAg
ICB7MTAwLCB0ZXN0ZmlsZSwgMCwgRUJBREZ9LAogICAgICB8ICAgICAgICAgICAgICAgXn5+fn5+
fn4KdW5saW5rYXQwMS5jOjQ3OjEzOiB3YXJuaW5nOiBpbml0aWFsaXphdGlvbiBkaXNjYXJkcyDi
gJhjb25zdOKAmSBxdWFsaWZpZXIgZnJvbSBwb2ludGVyIHRhcmdldCB0eXBlIFstV2Rpc2NhcmRl
ZC1xdWFsaWZpZXJzXQogICA0NyB8ICAgICAgICAgezAsIHRlc3RmaWxlLCA5OTk5LCBFSU5WQUx9
LAogICAgICB8ICAgICAgICAgICAgIF5+fn5+fn5+CnVubGlua2F0MDEuYzo0ODoyMDogd2Fybmlu
ZzogaW5pdGlhbGl6YXRpb24gZGlzY2FyZHMg4oCYY29uc3TigJkgcXVhbGlmaWVyIGZyb20gcG9p
bnRlciB0YXJnZXQgdHlwZSBbLVdkaXNjYXJkZWQtcXVhbGlmaWVyc10KICAgNDggfCAgICAgICAg
IHtBVF9GRENXRCwgdGVzdGZpbGUsIDAsIDB9LAogICAgICB8ICAgICAgICAgICAgICAgICAgICBe
fn5+fn5+fgp1bmxpbmthdDAxLmM6NDk6MTM6IHdhcm5pbmc6IGluaXRpYWxpemF0aW9uIGRpc2Nh
cmRzIOKAmGNvbnN04oCZIHF1YWxpZmllciBmcm9tIHBvaW50ZXIgdGFyZ2V0IHR5cGUgWy1XZGlz
Y2FyZGVkLXF1YWxpZmllcnNdCiAgIDQ5IHwgICAgICAgICB7MCwgc3VicGF0aG5hbWUsIEFUX1JF
TU9WRURJUiwgMH0sCiAgICAgIHwgICAgICAgICAgICAgXn5+fn5+fn5+fn4KClBsZWFzZSBuZXh0
IHRpbWUgdHJ5IHRvIG5vdCBpbnRyb2R1Y2UgbmV3IHdhcm5pbmdzLgoKVGhhbmtzLCBtZXJnZWQh
CgpLaW5kIHJlZ2FyZHMsClBldHIKCj4gKwlpbnQgZmxhZzsKPiArCWludCBleHBfZXJybm87Cj4g
K30gdGNbXSA9IHsKPiArCXswLCB0ZXN0ZmlsZSwgMCwgMH0sCj4gKwl7MCwgTlVMTCwgMCwgMH0s
Cj4gKwl7MCwgdGVzdGZpbGUsIDAsIEVOT1RESVJ9LAo+ICsJezEwMCwgdGVzdGZpbGUsIDAsIEVC
QURGfSwKPiArCXswLCB0ZXN0ZmlsZSwgOTk5OSwgRUlOVkFMfSwKPiArCXtBVF9GRENXRCwgdGVz
dGZpbGUsIDAsIDB9LAo+ICsJezAsIHN1YnBhdGhuYW1lLCBBVF9SRU1PVkVESVIsIDB9LAoKLS0g
Ck1haWxpbmcgbGlzdCBpbmZvOiBodHRwczovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cAo=
