Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id C5A0522BDC5
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 07:58:33 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 669963C4D06
	for <lists+linux-ltp@lfdr.de>; Fri, 24 Jul 2020 07:58:33 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 0712E3C18FA
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 07:58:29 +0200 (CEST)
Received: from mx2.suse.de (mx2.suse.de [195.135.220.15])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 135696018E3
 for <ltp@lists.linux.it>; Fri, 24 Jul 2020 07:57:09 +0200 (CEST)
Received: from relay2.suse.de (unknown [195.135.221.27])
 by mx2.suse.de (Postfix) with ESMTP id 6A0D7AC20;
 Fri, 24 Jul 2020 05:58:36 +0000 (UTC)
Date: Fri, 24 Jul 2020 07:58:26 +0200
From: Petr Vorel <pvorel@suse.cz>
To: Viresh Kumar <viresh.kumar@linaro.org>
Message-ID: <20200724055826.GE32086@dell5510>
References: <e51142a397858a2fe6a040563d3c0795a7d0bb05.1595511710.git.viresh.kumar@linaro.org>
 <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <a83166af3a2b432bb11a0876e18e15705479f32d.1595511710.git.viresh.kumar@linaro.org>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 4/4] libs: sigwait: Get rid of REPORT_SUCCESS()
 macro
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
Cc: Vincent Guittot <vincent.guittot@linaro.org>, ltp@lists.linux.it
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

SGkgVmlyZXNoLAoKUmV2aWV3ZWQtYnk6IFBldHIgVm9yZWwgPHB2b3JlbEBzdXNlLmN6PgoKQWx0
aG91Z2ggdGhlc2UgZXJyb3JzIGFyZSBzdGlsbCBoZXJlOgoKc2lnd2FpdC5jOiBJbiBmdW5jdGlv
biDigJh0ZXN0X21hc2tlZF9tYXRjaGluZ+KAmToKc2lnd2FpdC5jOjE1Nzo0Mjogd2FybmluZzog
cGFzc2luZyBhcmd1bWVudCAzIHRvIHJlc3RyaWN0LXF1YWxpZmllZCBwYXJhbWV0ZXIgYWxpYXNl
cyB3aXRoIGFyZ3VtZW50IDIgWy1XcmVzdHJpY3RdCiAgMTU3IHwgIFRFU1Qoc2lncHJvY21hc2so
U0lHX1NFVE1BU0ssICZvbGRtYXNrLCAmb2xkbWFzaykpOwogICAgICB8ICAgICAgICAgICAgICAg
ICAgICAgICAgICAgICAgICB+fn5+fn5+fiAgXn5+fn5+fn4KLi4vLi4vaW5jbHVkZS90c3RfdGVz
dC5oOjI2NjoxMzogbm90ZTogaW4gZGVmaW5pdGlvbiBvZiBtYWNybyDigJhURVNU4oCZCiAgMjY2
IHwgICBUU1RfUkVUID0gU0NBTEw7IFwKICAgICAgfCAgICAgICAgICAgICBefn5+fgpzaWd3YWl0
LmM6IEluIGZ1bmN0aW9uIOKAmHRlc3RfbWFza2VkX21hdGNoaW5nX3J04oCZOgpzaWd3YWl0LmM6
MjI2OjQyOiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDMgdG8gcmVzdHJpY3QtcXVhbGlmaWVk
IHBhcmFtZXRlciBhbGlhc2VzIHdpdGggYXJndW1lbnQgMiBbLVdyZXN0cmljdF0KICAyMjYgfCAg
VEVTVChzaWdwcm9jbWFzayhTSUdfU0VUTUFTSywgJm9sZG1hc2ssICZvbGRtYXNrKSk7CiAgICAg
IHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+fn5+fn5+ICBefn5+fn5+fgouLi8u
Li9pbmNsdWRlL3RzdF90ZXN0Lmg6MjY2OjEzOiBub3RlOiBpbiBkZWZpbml0aW9uIG9mIG1hY3Jv
IOKAmFRFU1TigJkKICAyNjYgfCAgIFRTVF9SRVQgPSBTQ0FMTDsgXAogICAgICB8ICAgICAgICAg
ICAgIF5+fn5+CnNpZ3dhaXQuYzogSW4gZnVuY3Rpb24g4oCYdGVzdF9tYXNrZWRfbWF0Y2hpbmdf
bm9pbmZv4oCZOgpzaWd3YWl0LmM6MjY1OjQyOiB3YXJuaW5nOiBwYXNzaW5nIGFyZ3VtZW50IDMg
dG8gcmVzdHJpY3QtcXVhbGlmaWVkIHBhcmFtZXRlciBhbGlhc2VzIHdpdGggYXJndW1lbnQgMiBb
LVdyZXN0cmljdF0KICAyNjUgfCAgVEVTVChzaWdwcm9jbWFzayhTSUdfU0VUTUFTSywgJm9sZG1h
c2ssICZvbGRtYXNrKSk7CiAgICAgIHwgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgIH5+
fn5+fn5+ICBefn5+fn5+fgouLi8uLi9pbmNsdWRlL3RzdF90ZXN0Lmg6MjY2OjEzOiBub3RlOiBp
biBkZWZpbml0aW9uIG9mIG1hY3JvIOKAmFRFU1TigJkKICAyNjYgfCAgIFRTVF9SRVQgPSBTQ0FM
TDsgXAogICAgICB8ICAgICAgICAgICAgIF5+fn5+CnNpZ3dhaXQuYzogSW4gZnVuY3Rpb24g4oCY
dGVzdF9iYWRfYWRkcmVzc+KAmToKc2lnd2FpdC5jOjMxMjo0Mjogd2FybmluZzogcGFzc2luZyBh
cmd1bWVudCAzIHRvIHJlc3RyaWN0LXF1YWxpZmllZCBwYXJhbWV0ZXIgYWxpYXNlcyB3aXRoIGFy
Z3VtZW50IDIgWy1XcmVzdHJpY3RdCiAgMzEyIHwgIFRFU1Qoc2lncHJvY21hc2soU0lHX1NFVE1B
U0ssICZvbGRtYXNrLCAmb2xkbWFzaykpOwogICAgICB8ICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICB+fn5+fn5+fiAgXn5+fn5+fn4KCklNSE8gd2Ugc2hvdWxkbid0IHVzZSBvbGRtYXNr
IGZvciBzcmMgYW5kIGRlc3QuCgpLaW5kIHJlZ2FyZHMsClBldHIKCi0tIApNYWlsaW5nIGxpc3Qg
aW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHAK
