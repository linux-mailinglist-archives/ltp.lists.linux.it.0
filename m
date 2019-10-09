Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id CEC28D143E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 18:39:43 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 43DBB3C226E
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Oct 2019 18:39:43 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 95CF13C203D
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 18:39:39 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id B522F1A014AD
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 18:39:38 +0200 (CEST)
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.phx2.redhat.com
 [10.5.11.23])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 44205308FBA6
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:39:37 +0000 (UTC)
Received: from colo-mx.corp.redhat.com
 (colo-mx02.intmail.prod.int.phx2.redhat.com [10.5.11.21])
 by smtp.corp.redhat.com (Postfix) with ESMTPS id 3B1C919C69
 for <ltp@lists.linux.it>; Wed,  9 Oct 2019 16:39:37 +0000 (UTC)
Received: from zmail17.collab.prod.int.phx2.redhat.com
 (zmail17.collab.prod.int.phx2.redhat.com [10.5.83.19])
 by colo-mx.corp.redhat.com (Postfix) with ESMTP id 30D474E589;
 Wed,  9 Oct 2019 16:39:37 +0000 (UTC)
Date: Wed, 9 Oct 2019 12:39:37 -0400 (EDT)
From: Jan Stancek <jstancek@redhat.com>
To: LTP List <ltp@lists.linux.it>
Message-ID: <1307292443.5395186.1570639177003.JavaMail.zimbra@redhat.com>
In-Reply-To: <441865364.5393998.1570638574134.JavaMail.zimbra@redhat.com>
References: <1d51b701-2210-360f-588b-f25fc22b09b3@redhat.com>
 <1909680792.5387095.1570635404942.JavaMail.zimbra@redhat.com>
 <441865364.5393998.1570638574134.JavaMail.zimbra@redhat.com>
MIME-Version: 1.0
X-Originating-IP: [10.40.204.157, 10.4.195.28]
Thread-Topic: CKI moving to Fedora 31 for upstream jobs
Thread-Index: 0uk2eMpuXZTDkBE1n+GiNHeUWRvel6vVmhGSQy8/l+w=
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.23
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16
 (mx1.redhat.com [10.5.110.43]); Wed, 09 Oct 2019 16:39:37 +0000 (UTC)
X-Virus-Scanned: clamav-milter 0.99.2 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=SPF_HELO_PASS,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-3.smtp.seeweb.it
Subject: [LTP] systemd v243 and OOMs // Was: CKI moving to Fedora 31 for
 upstream jobs
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
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

PiAtLS0tLSBPcmlnaW5hbCBNZXNzYWdlIC0tLS0tCj4gPiAqIExUUCBhYm9ydHMgYWZ0ZXIgbWF4
X21hcF9jb3VudAo+ID4gWzEwODg1Ljk3OTAwNV0gTFRQOiBzdGFydGluZyBtYXhfbWFwX2NvdW50
IChtYXhfbWFwX2NvdW50IC1pIDEwKQo+ID4gWy0tIE1BUksgLS0gVHVlIE9jdMKgIDggMTU6MDU6
MDAgMjAxOV0KPiA+IFstLSBNQVJLIC0tIFR1ZSBPY3TCoCA4IDE1OjEwOjAwIDIwMTldCj4gPiBb
LS0gTUFSSyAtLSBUdWUgT2N0wqAgOCAxNToxNTowMCAyMDE5XQo+ID4gWy0tIE1BUksgLS0gVHVl
IE9jdMKgIDggMTU6MjA6MDAgMjAxOV0KPiAKPiBUaGlzIGlzIHN0cmFuZ2UuCj4gCj4gSXQgbG9v
a3Mga2luZC1vZiBPT00gcmVsYXRlZCwgYmVjYXVzZSAncmVzdHJhaW50ZCcgcHJvY2VzcyBqdXN0
IGRpc2FwcGVhcnMKPiB3aGlsZSBydW5uaW5nIG9vbTAxLiBUaGVyZSdzIG5vIG1lc3NhZ2UgZnJv
bSBPT00gdGhhdCBpdCB3YXMga2lsbGVkLgoKKGZvcndhcmRpbmcgdG8gTFRQIGZvciBmeWkpCgpO
ZXcgc3lzdGVtZCAodjI0MykgaGFzIGEgZmVhdHVyZSwgd2hpY2ggYXBwZWFycyB0byBiZSBraWxs
aW5nIG91ciB0ZXN0IGhhcm5lc3MgYnkgZGVmYXVsdC4KCmh0dHBzOi8vd3d3LmZyZWVkZXNrdG9w
Lm9yZy9zb2Z0d2FyZS9zeXN0ZW1kL21hbi9zeXN0ZW1kLnNlcnZpY2UuaHRtbCMKICAiT09NUG9s
aWN5PSAuLi4gSWYgc2V0IHRvIHN0b3AgdGhlIGV2ZW50IGlzIGxvZ2dlZCBidXQgdGhlIHNlcnZp
Y2UgaXMgdGVybWluYXRlZCBjbGVhbmx5IGJ5IHRoZSBzZXJ2aWNlIG1hbmFnZXIuIgoKSGFybmVz
cyBwcm9jZXNzIChzdGFydGVkIGJ5IHN5c3RlbWQpIHN0YXJ0cyBMVFAuIExUUCBydW5zIG9vbTAx
LCB3aGVyZSBjaGlsZCBwcm9jZXNzIGdldHMKa2lsbGVkIGJ5IE9PTSBhbmQgdGhlbiBzeXN0ZW1k
ICJjbGVhbnMgdXAiIGhhcm5lc3Mgc2VydmljZSBhbmQgam9iIGFib3J0czoKCk9jdCAwOSAxMjow
ODo0NCBocC1kbDE4MC0wMi5raHcubGFiLmVuZy5ib3MucmVkaGF0LmNvbSByZXN0cmFpbnRkWzgz
MF06ICoqKiBDdXJyZW50IFRpbWU6IFdlZCBPY3QgMDkgMTI6MDg6NDQgMjAxOSBMb2NhbHdhdGNo
ZG9nIGF0OiBXZWQgT2N0IDA5IDE1OjEzOjQzIDIwMTkKT2N0IDA5IDEyOjA5OjQ0IGhwLWRsMTgw
LTAyLmtody5sYWIuZW5nLmJvcy5yZWRoYXQuY29tIHJlc3RyYWludGRbODMwXTogKioqIEN1cnJl
bnQgVGltZTogV2VkIE9jdCAwOSAxMjowOTo0NCAyMDE5IExvY2Fsd2F0Y2hkb2cgYXQ6IFdlZCBP
Y3QgMDkgMTU6MTM6NDMgMjAxOQpPY3QgMDkgMTI6MTA6NDggaHAtZGwxODAtMDIua2h3LmxhYi5l
bmcuYm9zLnJlZGhhdC5jb20gc3lzdGVtZFsxXTogcmVzdHJhaW50ZC5zZXJ2aWNlOiBBIHByb2Nl
c3Mgb2YgdGhpcyB1bml0IGhhcyBiZWVuIGtpbGxlZCBieSB0aGUgT09NIGtpbGxlci4KT2N0IDA5
IDEyOjEyOjUxIGhwLWRsMTgwLTAyLmtody5sYWIuZW5nLmJvcy5yZWRoYXQuY29tIHJlc3RyYWlu
dGRbODMwXTogKioqIEN1cnJlbnQgVGltZTogV2VkIE9jdCAwOSAxMjoxMDo1MSAyMDE5IExvY2Fs
d2F0Y2hkb2cgYXQ6IFdlZCBPY3QgMDkgMTU6MTM6NDMgMjAxOQpPY3QgMDkgMTI6MTI6NTQgaHAt
ZGwxODAtMDIua2h3LmxhYi5lbmcuYm9zLnJlZGhhdC5jb20gc3lzdGVtZFsxXTogcmVzdHJhaW50
ZC5zZXJ2aWNlOiBBIHByb2Nlc3Mgb2YgdGhpcyB1bml0IGhhcyBiZWVuIGtpbGxlZCBieSB0aGUg
T09NIGtpbGxlci4KT2N0IDA5IDEyOjEzOjA0IGhwLWRsMTgwLTAyLmtody5sYWIuZW5nLmJvcy5y
ZWRoYXQuY29tIHJlc3RyYWludGRbODMwXTogTW9kdWxlcyBMb2FkZWQgICAgICAgICBubHNfdXRm
OCBpc29mcyBkdW1teSB2ZXRoIG1pbml4IG5mc3YzIG5mc19hY2wgbmZzIGxvY2tkIGdyYWNlID4K
T2N0IDA5IDEyOjEyOjU0IGhwLWRsMTgwLTAyLmtody5sYWIuZW5nLmJvcy5yZWRoYXQuY29tIHN5
c3RlbWRbMV06IHJlc3RyYWludGQuc2VydmljZTogS2lsbGluZyBwcm9jZXNzIDgzMCAocmVzdHJh
aW50ZCkgd2l0aCBzaWduYWwgU0lHS0lMTC4KT2N0IDA5IDEyOjEzOjAzIGhwLWRsMTgwLTAyLmto
dy5sYWIuZW5nLmJvcy5yZWRoYXQuY29tIHN5c3RlbWRbMV06IHJlc3RyYWludGQuc2VydmljZTog
TWFpbiBwcm9jZXNzIGV4aXRlZCwgY29kZT1raWxsZWQsIHN0YXR1cz05L0tJTEwKT2N0IDA5IDEy
OjEzOjAzIGhwLWRsMTgwLTAyLmtody5sYWIuZW5nLmJvcy5yZWRoYXQuY29tIHN5c3RlbWRbMV06
IHJlc3RyYWludGQuc2VydmljZTogRmFpbGVkIHdpdGggcmVzdWx0ICdvb20ta2lsbCcuCgpSZWdh
cmRzLApKYW4KCi0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9s
aXN0aW5mby9sdHAK
