Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 44B40D4D5E
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 07:58:32 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 9626C3C2350
	for <lists+linux-ltp@lfdr.de>; Sat, 12 Oct 2019 07:58:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::5])
 by picard.linux.it (Postfix) with ESMTP id 3FBDB3C21DD
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 07:58:26 +0200 (CEST)
Received: from mx1.redhat.com (mx1.redhat.com [209.132.183.28])
 (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
 (No client certificate requested)
 by in-5.smtp.seeweb.it (Postfix) with ESMTPS id 9269C60150C
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 07:56:40 +0200 (CEST)
Received: from mail-ot1-f72.google.com (mail-ot1-f72.google.com
 [209.85.210.72])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by mx1.redhat.com (Postfix) with ESMTPS id 163D290C99
 for <ltp@lists.linux.it>; Sat, 12 Oct 2019 05:58:22 +0000 (UTC)
Received: by mail-ot1-f72.google.com with SMTP id i12so5900069oto.8
 for <ltp@lists.linux.it>; Fri, 11 Oct 2019 22:58:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=W7bE0WRm3fDsFGkRcv2KPLcQVeMJ0w5tmKb2gZ/B5Zk=;
 b=pBdbVdQU8v7xFMbePizBJmYXb3XU+c++yBP64j+mR3QBs1s1WZHVr6OuE6LirNW1IS
 3WNNfZ/wymcxIrCFCHfw0wmcvWAh+rVTFNafIOTGUDIm+AU4b75h1sLlfU/DgX7X+nuY
 RjM5ZFpJgc5KtIfz5dz3U89J/2Qm/cTUzy4vpnidj0G41koYJBmLXx2CnkOryc+8GFeF
 olRaTS7lsgv2oP0Qgp2WkmtgzKqdP76XuBjh+HUeF8r+PYgrcyh+N/JPwULiF19590hc
 w2m6M/lZkh7CcD5QMzLMe+9zK7BmvgPQShN8EtOW+iAYUpg6RTOGnLz0GhrohUsii4aJ
 fZZw==
X-Gm-Message-State: APjAAAUbBWns6M55v2FT7oMxk/Vu4VlxSErzAuL36Aty0QWIdWLVebv+
 ht5k/N51XFAlsEHaH6G5GoJ53qOio9Mia8NoXVNEkW031zvrmH+zPgdU4dsPloFbgrjVNbOQSN/
 gP4hkezMHEZfB+MeFmV8UOvbLW18=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr11388739otp.17.1570859901595; 
 Fri, 11 Oct 2019 22:58:21 -0700 (PDT)
X-Google-Smtp-Source: APXvYqwampXp0eafCFVm6khYhR2XTPDYeZ3Kh2kwIxNa8wAdHttlixCn3Nm3aFqMKMsjJN4VDvPV6mQecjYrWi9dh3k=
X-Received: by 2002:a9d:6d89:: with SMTP id x9mr11388728otp.17.1570859901313; 
 Fri, 11 Oct 2019 22:58:21 -0700 (PDT)
MIME-Version: 1.0
References: <26d555b1d9deddb5a6f0a93a7c7d3b00e8abc1ff.1570616598.git.jstancek@redhat.com>
 <8c5d507fd19bc3110561ed1c666b7ac47442e09e.1570632125.git.jstancek@redhat.com>
 <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
In-Reply-To: <CAEemH2d82pP2mwHnw42h-17HipGsVeYesfzg7o4axvCiRKU0=Q@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Sat, 12 Oct 2019 13:58:09 +0800
Message-ID: <CAEemH2eYc1VVtavWKTE-x1gqY6q7qyMVZ-bETXJytPkdvHJriw@mail.gmail.com>
To: Jan Stancek <jstancek@redhat.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=-0.0 required=7.0 tests=HTML_MESSAGE,SPF_HELO_PASS,
 SPF_PASS autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-5.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2] read_all: retry to queue work for any worker
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0994059421=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0994059421==
Content-Type: multipart/alternative; boundary="0000000000006901c90594b052f4"

--0000000000006901c90594b052f4
Content-Type: text/plain; charset="UTF-8"

Hi Jan,

On Fri, Oct 11, 2019 at 4:24 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Wed, Oct 9, 2019 at 10:43 PM Jan Stancek <jstancek@redhat.com> wrote:
>
>> read_all is currently retrying only for short time period and it's
>> retrying to queue for same worker. If that worker is busy, it easily
>> hits timeout.
>>
>> For example 'kernel_page_tables' on aarch64 can take long time to
>> open/read:
>>   # time dd if=/sys/kernel/debug/kernel_page_tables of=/dev/null count=1
>> bs=1024
>>   1+0 records in
>>   1+0 records out
>>   1024 bytes (1.0 kB, 1.0 KiB) copied, 13.0531 s, 0.1 kB/s
>>
>>   real    0m13.066s
>>   user    0m0.000s
>>   sys     0m13.059s
>>
>> Rather than retrying to queue for specific worker, pick any that can
>> accept
>> the work and keep trying until we succeed or hit test timeout.
>>
>
RFC:

Base on your patch, I'm thinking to achieve a new macro TST_INFILOOP_FUNC
which can repeat the @FUNC infinitely. Do you feel it satisfies your
requirements to some degree or meaningful to LTP?
+/**
+ * TST_INFILOOP_FUNC() - Infinitely retry a function with an increasing
delay.
+ * @FUNC - The function which will be retried
+ * @ERET - The value returned from @FUNC on success
+ *
+ * This macro will call @FUNC in an infinite loop with a delay. If @FUNC
+ * returns @ERET then the loop exits. The delay between retries starts at
one
+ * microsecond and is then doubled each iteration until it exceeds one
second.
+ * When the delay exceeds one-second @FUNC keep repeat until get success
or hit
+ * test timeout.
+ */
+#define TST_INFILOOP_FUNC(FUNC, ERET) \
+       TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, -1)
+
 #define TST_RETRY_FN_EXP_BACKOFF(FUNC, ERET, MAX_DELAY)        \
-({     int tst_delay_ = 1;                                             \
+({     int tst_delay_ = 1, tst_max_delay_ = MAX_DELAY;                 \
+       if (MAX_DELAY < 0)                                              \
+                tst_max_delay_ *= MAX_DELAY;                           \
        for (;;) {                                                      \
                typeof(FUNC) tst_ret_ = FUNC;                           \
                if (tst_ret_ == ERET)                                   \
                        break;                                          \
-               if (tst_delay_ < MAX_DELAY * 1000000) {                 \
-                       usleep(tst_delay_);                             \
+               usleep(tst_delay_);                                     \
+               if (tst_delay_ < tst_max_delay_ * 1000000) {            \
                        tst_delay_ *= 2;                                \
                } else {                                                \
-                       tst_brk(TBROK, #FUNC" timed out");              \
+                        if (MAX_DELAY > 0)                             \
+                               tst_brk(TBROK, #FUNC" timed out");      \
                }                                                       \
        }                                                               \
        ERET;                                                           \

Add pastebin to better readable: http://pastebin.test.redhat.com/805437

-- 
Regards,
Li Wang

--0000000000006901c90594b052f4
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SGkgSmFuLDwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNz
PSJnbWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIEZyaSwg
T2N0IDExLCAyMDE5IGF0IDQ6MjQgUE0gTGkgV2FuZyAmbHQ7PGEgaHJlZj0ibWFpbHRvOmxpd2Fu
Z0ByZWRoYXQuY29tIj5saXdhbmdAcmVkaGF0LmNvbTwvYT4mZ3Q7IHdyb3RlOjxicj48L2Rpdj48
YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJtYXJnaW46MHB4IDBweCAwcHgg
MC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0LDIwNCk7cGFkZGluZy1sZWZ0
OjFleCI+PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBzdHlsZT0iZm9udC1zaXpl
OnNtYWxsIj48YnI+PC9kaXY+PC9kaXY+PGJyPjxkaXYgY2xhc3M9ImdtYWlsX3F1b3RlIj48ZGl2
IGRpcj0ibHRyIiBjbGFzcz0iZ21haWxfYXR0ciI+T24gV2VkLCBPY3QgOSwgMjAxOSBhdCAxMDo0
MyBQTSBKYW4gU3RhbmNlayAmbHQ7PGEgaHJlZj0ibWFpbHRvOmpzdGFuY2VrQHJlZGhhdC5jb20i
IHRhcmdldD0iX2JsYW5rIj5qc3RhbmNla0ByZWRoYXQuY29tPC9hPiZndDsgd3JvdGU6PGJyPjwv
ZGl2PjxibG9ja3F1b3RlIGNsYXNzPSJnbWFpbF9xdW90ZSIgc3R5bGU9Im1hcmdpbjowcHggMHB4
IDBweCAwLjhleDtib3JkZXItbGVmdDoxcHggc29saWQgcmdiKDIwNCwyMDQsMjA0KTtwYWRkaW5n
LWxlZnQ6MWV4Ij5yZWFkX2FsbCBpcyBjdXJyZW50bHkgcmV0cnlpbmcgb25seSBmb3Igc2hvcnQg
dGltZSBwZXJpb2QgYW5kIGl0JiMzOTtzPGJyPg0KcmV0cnlpbmcgdG8gcXVldWUgZm9yIHNhbWUg
d29ya2VyLiBJZiB0aGF0IHdvcmtlciBpcyBidXN5LCBpdCBlYXNpbHk8YnI+DQpoaXRzIHRpbWVv
dXQuPGJyPg0KPGJyPg0KRm9yIGV4YW1wbGUgJiMzOTtrZXJuZWxfcGFnZV90YWJsZXMmIzM5OyBv
biBhYXJjaDY0IGNhbiB0YWtlIGxvbmcgdGltZSB0byBvcGVuL3JlYWQ6PGJyPg0KwqAgIyB0aW1l
IGRkIGlmPS9zeXMva2VybmVsL2RlYnVnL2tlcm5lbF9wYWdlX3RhYmxlcyBvZj0vZGV2L251bGwg
Y291bnQ9MSBicz0xMDI0PGJyPg0KwqAgMSswIHJlY29yZHMgaW48YnI+DQrCoCAxKzAgcmVjb3Jk
cyBvdXQ8YnI+DQrCoCAxMDI0IGJ5dGVzICgxLjAga0IsIDEuMCBLaUIpIGNvcGllZCwgMTMuMDUz
MSBzLCAwLjEga0Ivczxicj4NCjxicj4NCsKgIHJlYWzCoCDCoCAwbTEzLjA2NnM8YnI+DQrCoCB1
c2VywqAgwqAgMG0wLjAwMHM8YnI+DQrCoCBzeXPCoCDCoCDCoDBtMTMuMDU5czxicj4NCjxicj4N
ClJhdGhlciB0aGFuIHJldHJ5aW5nIHRvIHF1ZXVlIGZvciBzcGVjaWZpYyB3b3JrZXIsIHBpY2sg
YW55IHRoYXQgY2FuIGFjY2VwdDxicj4NCnRoZSB3b3JrIGFuZCBrZWVwIHRyeWluZyB1bnRpbCB3
ZSBzdWNjZWVkIG9yIGhpdCB0ZXN0IHRpbWVvdXQuPGJyPjwvYmxvY2txdW90ZT48L2Rpdj48L2Rp
dj48L2Jsb2NrcXVvdGU+PGRpdj48YnI+PC9kaXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj5SRkM6PC9kaXY+PGJyPjwvZGl2PjxkaXY+PGRp
diBjbGFzcz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+QmFzZSBvbiB5
b3VyIHBhdGNoLCBJJiMzOTttIHRoaW5raW5nIHRvIGFjaGlldmUgYSBuZXcgbWFjcm/CoFRTVF9J
TkZJTE9PUF9GVU5DIHdoaWNoIGNhbiByZXBlYXQgdGhlwqBARlVOQyBpbmZpbml0ZWx5LiBEbyB5
b3UgZmVlbCBpdCBzYXRpc2ZpZXMgeW91ciByZXF1aXJlbWVudHMgdG8gc29tZSBkZWdyZWUgb3Ig
bWVhbmluZ2Z1bCB0byBMVFA/PC9kaXY+PC9kaXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj48L2Rpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZh
dWx0IiBzdHlsZT0iZm9udC1zaXplOnNtYWxsIj4rLyoqPGJyPisgKiBUU1RfSU5GSUxPT1BfRlVO
QygpIC0gSW5maW5pdGVseSByZXRyeSBhIGZ1bmN0aW9uIHdpdGggYW4gaW5jcmVhc2luZyBkZWxh
eS48YnI+KyAqIEBGVU5DIC0gVGhlIGZ1bmN0aW9uIHdoaWNoIHdpbGwgYmUgcmV0cmllZDxicj4r
ICogQEVSRVQgLSBUaGUgdmFsdWUgcmV0dXJuZWQgZnJvbSBARlVOQyBvbiBzdWNjZXNzPGJyPisg
Kjxicj4rICogVGhpcyBtYWNybyB3aWxsIGNhbGwgQEZVTkMgaW4gYW4gaW5maW5pdGUgbG9vcCB3
aXRoIGEgZGVsYXkuIElmIEBGVU5DPGJyPisgKiByZXR1cm5zIEBFUkVUIHRoZW4gdGhlIGxvb3Ag
ZXhpdHMuIFRoZSBkZWxheSBiZXR3ZWVuIHJldHJpZXMgc3RhcnRzIGF0IG9uZTxicj4rICogbWlj
cm9zZWNvbmQgYW5kIGlzIHRoZW4gZG91YmxlZCBlYWNoIGl0ZXJhdGlvbiB1bnRpbCBpdCBleGNl
ZWRzIG9uZSBzZWNvbmQuPGJyPisgKiBXaGVuIHRoZSBkZWxheSBleGNlZWRzIG9uZS1zZWNvbmQg
QEZVTkMga2VlcCByZXBlYXQgdW50aWwgZ2V0IHN1Y2Nlc3Mgb3IgaGl0PGJyPisgKiB0ZXN0IHRp
bWVvdXQuPGJyPisgKi88YnI+KyNkZWZpbmUgVFNUX0lORklMT09QX0ZVTkMoRlVOQywgRVJFVCkg
XDxicj4rIMKgIMKgIMKgIFRTVF9SRVRSWV9GTl9FWFBfQkFDS09GRihGVU5DLCBFUkVULCAtMSk8
YnI+Kzxicj7CoCNkZWZpbmUgVFNUX1JFVFJZX0ZOX0VYUF9CQUNLT0ZGKEZVTkMsIEVSRVQsIE1B
WF9ERUxBWSkgwqAgwqAgwqAgwqBcPGJyPi0oeyDCoCDCoCBpbnQgdHN0X2RlbGF5XyA9IDE7IMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+Kyh7IMKgIMKgIGludCB0c3RfZGVsYXlfID0gMSwgdHN0X21heF9kZWxheV8g
PSBNQVhfREVMQVk7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+KyDCoCDCoCDCoCBpZiAo
TUFYX0RFTEFZICZsdDsgMCkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPisgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB0c3RfbWF4X2RlbGF5XyAqPSBNQVhfREVMQVk7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFw8YnI+wqAgwqAgwqAgwqAgZm9yICg7OykgeyDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoFw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHlwZW9mKEZVTkMpIHRzdF9yZXRf
ID0gRlVOQzsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj7CoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBpZiAodHN0X3JldF8gPT0gRVJFVCkgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj7CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCBicmVhazsgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPi0gwqAgwqAgwqAgwqAgwqAgwqAg
wqAgaWYgKHRzdF9kZWxheV8gJmx0OyBNQVhfREVMQVkgKiAxMDAwMDAwKSB7IMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIFw8YnI+LSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1c2xl
ZXAodHN0X2RlbGF5Xyk7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IFw8YnI+KyDCoCDCoCDCoCDCoCDCoCDCoCDCoCB1c2xlZXAodHN0X2RlbGF5Xyk7IMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+KyDCoCDC
oCDCoCDCoCDCoCDCoCDCoCBpZiAodHN0X2RlbGF5XyAmbHQ7IHRzdF9tYXhfZGVsYXlfICogMTAw
MDAwMCkgeyDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgdHN0X2RlbGF5XyAqPSAyOyDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoFw8YnI+wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgfSBlbHNlIHsgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqBcPGJyPi0gwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgdHN0X2Jy
ayhUQlJPSywgI0ZVTkMmcXVvdDsgdGltZWQgb3V0JnF1b3Q7KTsgwqAgwqAgwqAgwqAgwqAgwqAg
wqBcPGJyPisgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoTUFYX0RFTEFZ
ICZndDsgMCkgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4r
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIHRzdF9icmsoVEJS
T0ssICNGVU5DJnF1b3Q7IHRpbWVkIG91dCZxdW90Oyk7IMKgIMKgIMKgXDxicj7CoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCB9IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8YnI+wqAgwqAgwqAgwqAg
fSDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCBcPGJyPsKgIMKgIMKgIMKgIEVS
RVQ7IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIFw8L2Rpdj48L2Rpdj48L2Rpdj48ZGl2
Pjxicj48L2Rpdj48ZGl2PjxkaXYgY2xhc3M9ImdtYWlsX2RlZmF1bHQiIHN0eWxlPSJmb250LXNp
emU6c21hbGwiPkFkZCBwYXN0ZWJpbiB0byBiZXR0ZXIgcmVhZGFibGU6IDxhIGhyZWY9Imh0dHA6
Ly9wYXN0ZWJpbi50ZXN0LnJlZGhhdC5jb20vODA1NDM3Ij5odHRwOi8vcGFzdGViaW4udGVzdC5y
ZWRoYXQuY29tLzgwNTQzNzwvYT48L2Rpdj48YnI+PC9kaXY+LS0gPGJyPjxkaXYgZGlyPSJsdHIi
IGNsYXNzPSJnbWFpbF9zaWduYXR1cmUiPjxkaXYgZGlyPSJsdHIiPjxkaXY+UmVnYXJkcyw8YnI+
PC9kaXY+PGRpdj5MaSBXYW5nPGJyPjwvZGl2PjwvZGl2PjwvZGl2PjwvZGl2Pg0K
--0000000000006901c90594b052f4--

--===============0994059421==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0994059421==--
