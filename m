Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C1DC18668
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:54:31 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 228613EABD0
	for <lists+linux-ltp@lfdr.de>; Thu,  9 May 2019 09:54:31 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-4.smtp.seeweb.it (in-4.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::4])
 by picard.linux.it (Postfix) with ESMTP id 8A3133EABBF
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:54:29 +0200 (CEST)
Received: from mail-vk1-f177.google.com (mail-vk1-f177.google.com
 [209.85.221.177])
 (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
 (No client certificate requested)
 by in-4.smtp.seeweb.it (Postfix) with ESMTPS id E0CA81000BD8
 for <ltp@lists.linux.it>; Thu,  9 May 2019 09:54:24 +0200 (CEST)
Received: by mail-vk1-f177.google.com with SMTP id h72so354182vkh.10
 for <ltp@lists.linux.it>; Thu, 09 May 2019 00:54:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=/Y8MumTGH40a0zI8DiLzRN0d5d+pu51pBJkP/iMuH38=;
 b=obGPCOiUw9XmNZBpFYWqeNFclNDxVCNG3Iz3zZHvatOOEN2/lKHzUsmlH4JrQE9Xtu
 veny3O8vGxxzv7WRyIMQuUPNohTkWus3pyFi6OlDWH/zt/S/ovIhKAoOCmCp+cOBCXBW
 mKdQXvcRawzKlt7eFmJvfnRLbTB4x8SpyYs2AxLzi23iMVEMv2XnxDipWax2wk44KW8W
 ZuIW+/oaMQPQ4rlIJXQ6Rxln+wGkQw34kAd/BgelbFo4PkIBHz2YGOa8k2miKQOgeed8
 I+9XQt88BxC/ToKyhGJK79SMMTyKiepNfKw1CK+yH/EEhkS5vR6UQvE7WYH8ggtFt2Yj
 04kQ==
X-Gm-Message-State: APjAAAVTeHKkFV6re9ebI3rImkqmhG49aeKjKaWFUcD/t2bqMm00dK+q
 ROIf3Wz1EdFqI91ZrWqJE271M4PimRI0Sra2yPG7P24/elc=
X-Google-Smtp-Source: APXvYqzcD5tTsaEWaiCj6RNPuBgp4LcUfgPHNrtR7eP4L8L4AMW+wVUZOsWmjNsvFl3ziJDILYn5Z/D7lxKpNoWx2AE=
X-Received: by 2002:a1f:28d7:: with SMTP id o206mr853560vko.36.1557388466518; 
 Thu, 09 May 2019 00:54:26 -0700 (PDT)
MIME-Version: 1.0
References: <20190508084447.18191-1-liwang@redhat.com>
 <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
In-Reply-To: <20190509071605.GB6096@dhcp-9-109-247-167.in.ibm.com>
From: Li Wang <liwang@redhat.com>
Date: Thu, 9 May 2019 15:54:15 +0800
Message-ID: <CAEemH2e=9eRgj_1H50dY_=fEsL3vsZbxexxUceJhW24ebsQ1Kg@mail.gmail.com>
To: Balamuruhan S <bala24@linux.vnet.ibm.com>
X-Virus-Scanned: clamav-milter 0.99.2 at in-4.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.0 required=7.0 tests=HTML_MESSAGE,SPF_PASS
 autolearn=disabled version=3.4.0
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on in-4.smtp.seeweb.it
Cc: ltp@lists.linux.it
Subject: Re: [LTP] [PATCH v2 1/2] numa: fix numa test error with
 non-continuous nodes
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
Content-Type: multipart/mixed; boundary="===============1312089652=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1312089652==
Content-Type: multipart/alternative; boundary="0000000000005320c905886fc214"

--0000000000005320c905886fc214
Content-Type: text/plain; charset="UTF-8"

On Thu, May 9, 2019 at 3:16 PM Balamuruhan S <bala24@linux.vnet.ibm.com>
wrote:

> On Wed, May 08, 2019 at 04:44:46PM +0800, Li Wang wrote:
> > Numa test failed on such machine which has non-continuous numa nodes,
> > it gets wrong data because of the below syntax rule is not applicable
> > to that special situation.
> >   ` numastat -p $pid |awk '/^Total/ {print $'$((node+2))'}'
> > In this patch, we fix that via a bit complex way of awk to get the
> > allocated memory in specified node.
> >
> >   # numactl -H
> >   available: 2 nodes (0,8)
> >   node 0 cpus: 0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17 18
> >                19 20 21 22 23 24 25 26 27 28 29 30 31 32 33 34
> >                35 36 37 38 39 40 41 42 43 44 45 46 47 48 49 50
> >                51 52 53 54 55 56 57 58 59 60 61 62 63
> >   node 0 size: 257741 MB
> >   node 0 free: 253158 MB
> >   node 8 cpus: 64 65 66 67 68 69 70 71 72 73 74 75 76 77 78 79
> >                80 81 82 83 84 85 86 87 88 89 90 91 92 93 94 95
> >                96 97 98 99 100 101 102 103 104 105 106 107 108
> >                109 110 111 112 113 114 115 116 117 118 119 120
> >                121 122 123 124 125 126 127
> >   node 8 size: 261752 MB
> >   node 8 free: 240933 MB
> >   node distances:
> >   node   0   8
> >     0:  10  40
> >     8:  40  10
> >
> >   # numastat -p $pid
> >   Per-node process memory usage (in MBs) for PID 34168 (support_numa)
> >                              Node 0          Node 8           Total
> >                     --------------- --------------- ---------------
> >   Huge                         0.00            0.00            0.00
> >   Heap                         0.00            0.12            0.12
> >   Stack                        0.00            0.06            0.06
> >   Private                      1.62            1.50            3.12
> >   ----------------  --------------- --------------- ---------------
> >   Total                        1.62            1.69            3.31
> >
> > Signed-off-by: Li Wang <liwang@redhat.com>
> > Cc: Chunyu Hu <chuhu@redhat.com>
> > Cc: Cyril Hrubis <chrubis@suse.cz>
> > ---
> >  testcases/kernel/numa/numa01.sh | 26 ++++++++++++++++++++++----
> >  1 file changed, 22 insertions(+), 4 deletions(-)
> >
> > diff --git a/testcases/kernel/numa/numa01.sh
> b/testcases/kernel/numa/numa01.sh
> > index 33393ac8d..7f3dee849 100755
> > --- a/testcases/kernel/numa/numa01.sh
> > +++ b/testcases/kernel/numa/numa01.sh
> > @@ -52,9 +52,18 @@ TST_NEEDS_CMDS="awk bc numactl numastat"
> >  extract_numastat_p()
> >  {
> >       local pid=$1
> > -     local node=$(($2 + 2))
> > -
> > -     echo $(numastat -p $pid |awk '/^Total/ {print $'$node'}')
> > +     local node=$2
> > +
> > +     echo $(numastat -p $pid |               \
> > +             awk -v node=$node '/Node/ {     \
> > +             gsub("Node", "");               \
> > +             for (i=0; i<NF; i++)            \
> > +                     if ($i == node)         \
> > +                             col=i+1;        \
> > +                     next                    \
> > +             }                               \
> > +             /^Total/ {print $col}'          \
> > +     )
> >  }
>
> If we can use extract_numastat_p0 with node_index then the existing code
> works, for example if can index while iterating $node_list and use this
> with extract_numastat_p0 then it should work.
>

Hi Bala,

Sorry, I don't fully understand what's you mean here :(. Could you explain
something more for this method?



>
> This is just my thoughts, please feel free to correct me if I miss or
> it is something wrong. Thanks!
>
> -- Bala
> >
> >  check_for_support_numa()
> > @@ -363,7 +372,16 @@ test9()
> >               pid=$!
> >               TST_RETRY_FUNC "check_for_support_numa $pid" 0
> >
> > -             Mem_huge=$(echo $(numastat -p $pid |awk '/^Huge/ {print
> $'$((node+2))'}'))
> > +             Mem_huge=$(echo $(numastat -p $pid |    \
> > +                     awk -v node=$node '/Node/ {     \
> > +                     gsub("Node", "");               \
> > +                     for (i=0; i<NF; i++)            \
> > +                             if ($i == node)         \
> > +                                     col=i+1;        \
> > +                             next                    \
> > +                     }                               \
> > +                     /^Huge/ {print $col}')          \
> > +             )
> >               Mem_huge=$((${Mem_huge%.*} * 1024))
> >
> >               if [ "$Mem_huge" -lt "$HPAGE_SIZE" ]; then
> > --
> > 2.20.1
> >
> >
> > --
> > Mailing list info: https://lists.linux.it/listinfo/ltp
>
>

-- 
Regards,
Li Wang

--0000000000005320c905886fc214
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: base64

PGRpdiBkaXI9Imx0ciI+PGRpdiBkaXI9Imx0ciI+PGRpdiBjbGFzcz0iZ21haWxfZGVmYXVsdCIg
c3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+PGJyPjwvZGl2PjwvZGl2Pjxicj48ZGl2IGNsYXNzPSJn
bWFpbF9xdW90ZSI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX2F0dHIiPk9uIFRodSwgTWF5
IDksIDIwMTkgYXQgMzoxNiBQTSBCYWxhbXVydWhhbiBTICZsdDs8YSBocmVmPSJtYWlsdG86YmFs
YTI0QGxpbnV4LnZuZXQuaWJtLmNvbSI+YmFsYTI0QGxpbnV4LnZuZXQuaWJtLmNvbTwvYT4mZ3Q7
IHdyb3RlOjxicj48L2Rpdj48YmxvY2txdW90ZSBjbGFzcz0iZ21haWxfcXVvdGUiIHN0eWxlPSJt
YXJnaW46MHB4IDBweCAwcHggMC44ZXg7Ym9yZGVyLWxlZnQ6MXB4IHNvbGlkIHJnYigyMDQsMjA0
LDIwNCk7cGFkZGluZy1sZWZ0OjFleCI+T24gV2VkLCBNYXkgMDgsIDIwMTkgYXQgMDQ6NDQ6NDZQ
TSArMDgwMCwgTGkgV2FuZyB3cm90ZTo8YnI+DQomZ3Q7IE51bWEgdGVzdCBmYWlsZWQgb24gc3Vj
aCBtYWNoaW5lIHdoaWNoIGhhcyBub24tY29udGludW91cyBudW1hIG5vZGVzLDxicj4NCiZndDsg
aXQgZ2V0cyB3cm9uZyBkYXRhIGJlY2F1c2Ugb2YgdGhlIGJlbG93IHN5bnRheCBydWxlIGlzIG5v
dCBhcHBsaWNhYmxlPGJyPg0KJmd0OyB0byB0aGF0IHNwZWNpYWwgc2l0dWF0aW9uLjxicj4NCiZn
dDvCoCDCoGAgbnVtYXN0YXQgLXAgJHBpZCB8YXdrICYjMzk7L15Ub3RhbC8ge3ByaW50ICQmIzM5
OyQoKG5vZGUrMikpJiMzOTt9JiMzOTs8YnI+DQomZ3Q7IEluIHRoaXMgcGF0Y2gsIHdlIGZpeCB0
aGF0IHZpYSBhIGJpdCBjb21wbGV4IHdheSBvZiBhd2sgdG8gZ2V0IHRoZTxicj4NCiZndDsgYWxs
b2NhdGVkIG1lbW9yeSBpbiBzcGVjaWZpZWQgbm9kZS48YnI+DQomZ3Q7IDxicj4NCiZndDvCoCDC
oCMgbnVtYWN0bCAtSDxicj4NCiZndDvCoCDCoGF2YWlsYWJsZTogMiBub2RlcyAoMCw4KTxicj4N
CiZndDvCoCDCoG5vZGUgMCBjcHVzOiAwIDEgMiAzIDQgNSA2IDcgOCA5IDEwIDExIDEyIDEzIDE0
IDE1IDE2IDE3IDE4PGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDE5IDIwIDIxIDIy
IDIzIDI0IDI1IDI2IDI3IDI4IDI5IDMwIDMxIDMyIDMzIDM0PGJyPg0KJmd0O8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIDM1IDM2IDM3IDM4IDM5IDQwIDQxIDQyIDQzIDQ0IDQ1IDQ2IDQ3IDQ4IDQ5
IDUwPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDUxIDUyIDUzIDU0IDU1IDU2IDU3
IDU4IDU5IDYwIDYxIDYyIDYzPGJyPg0KJmd0O8KgIMKgbm9kZSAwIHNpemU6IDI1Nzc0MSBNQjxi
cj4NCiZndDvCoCDCoG5vZGUgMCBmcmVlOiAyNTMxNTggTUI8YnI+DQomZ3Q7wqAgwqBub2RlIDgg
Y3B1czogNjQgNjUgNjYgNjcgNjggNjkgNzAgNzEgNzIgNzMgNzQgNzUgNzYgNzcgNzggNzk8YnI+
DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgODAgODEgODIgODMgODQgODUgODYgODcgODgg
ODkgOTAgOTEgOTIgOTMgOTQgOTU8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgOTYg
OTcgOTggOTkgMTAwIDEwMSAxMDIgMTAzIDEwNCAxMDUgMTA2IDEwNyAxMDg8YnI+DQomZ3Q7wqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgMTA5IDExMCAxMTEgMTEyIDExMyAxMTQgMTE1IDExNiAxMTcg
MTE4IDExOSAxMjA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMTIxIDEyMiAxMjMg
MTI0IDEyNSAxMjYgMTI3PGJyPg0KJmd0O8KgIMKgbm9kZSA4IHNpemU6IDI2MTc1MiBNQjxicj4N
CiZndDvCoCDCoG5vZGUgOCBmcmVlOiAyNDA5MzMgTUI8YnI+DQomZ3Q7wqAgwqBub2RlIGRpc3Rh
bmNlczo8YnI+DQomZ3Q7wqAgwqBub2RlwqAgwqAwwqAgwqA4PGJyPg0KJmd0O8KgIMKgIMKgMDrC
oCAxMMKgIDQwPGJyPg0KJmd0O8KgIMKgIMKgODrCoCA0MMKgIDEwPGJyPg0KJmd0OyA8YnI+DQom
Z3Q7wqAgwqAjIG51bWFzdGF0IC1wICRwaWQ8YnI+DQomZ3Q7wqAgwqBQZXItbm9kZSBwcm9jZXNz
IG1lbW9yeSB1c2FnZSAoaW4gTUJzKSBmb3IgUElEIDM0MTY4IChzdXBwb3J0X251bWEpPGJyPg0K
Jmd0O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIE5vZGUgMMKg
IMKgIMKgIMKgIMKgIE5vZGUgOMKgIMKgIMKgIMKgIMKgIMKgVG90YWw8YnI+DQomZ3Q7wqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAtLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0t
IC0tLS0tLS0tLS0tLS0tLTxicj4NCiZndDvCoCDCoEh1Z2XCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoDAuMDDCoCDCoCDCoCDCoCDCoCDCoCAwLjAwwqAgwqAgwqAgwqAgwqAg
wqAgMC4wMDxicj4NCiZndDvCoCDCoEhlYXDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoDAuMDDCoCDCoCDCoCDCoCDCoCDCoCAwLjEywqAgwqAgwqAgwqAgwqAgwqAgMC4xMjxi
cj4NCiZndDvCoCDCoFN0YWNrwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgMC4w
MMKgIMKgIMKgIMKgIMKgIMKgIDAuMDbCoCDCoCDCoCDCoCDCoCDCoCAwLjA2PGJyPg0KJmd0O8Kg
IMKgUHJpdmF0ZcKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIDEuNjLCoCDCoCDCoCDC
oCDCoCDCoCAxLjUwwqAgwqAgwqAgwqAgwqAgwqAgMy4xMjxicj4NCiZndDvCoCDCoC0tLS0tLS0t
LS0tLS0tLS3CoCAtLS0tLS0tLS0tLS0tLS0gLS0tLS0tLS0tLS0tLS0tIC0tLS0tLS0tLS0tLS0t
LTxicj4NCiZndDvCoCDCoFRvdGFswqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
MS42MsKgIMKgIMKgIMKgIMKgIMKgIDEuNjnCoCDCoCDCoCDCoCDCoCDCoCAzLjMxPGJyPg0KJmd0
OyA8YnI+DQomZ3Q7IFNpZ25lZC1vZmYtYnk6IExpIFdhbmcgJmx0OzxhIGhyZWY9Im1haWx0bzps
aXdhbmdAcmVkaGF0LmNvbSIgdGFyZ2V0PSJfYmxhbmsiPmxpd2FuZ0ByZWRoYXQuY29tPC9hPiZn
dDs8YnI+DQomZ3Q7IENjOiBDaHVueXUgSHUgJmx0OzxhIGhyZWY9Im1haWx0bzpjaHVodUByZWRo
YXQuY29tIiB0YXJnZXQ9Il9ibGFuayI+Y2h1aHVAcmVkaGF0LmNvbTwvYT4mZ3Q7PGJyPg0KJmd0
OyBDYzogQ3lyaWwgSHJ1YmlzICZsdDs8YSBocmVmPSJtYWlsdG86Y2hydWJpc0BzdXNlLmN6IiB0
YXJnZXQ9Il9ibGFuayI+Y2hydWJpc0BzdXNlLmN6PC9hPiZndDs8YnI+DQomZ3Q7IC0tLTxicj4N
CiZndDvCoCB0ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoIHwgMjYgKysrKysrKysrKysr
KysrKysrKysrKy0tLS08YnI+DQomZ3Q7wqAgMSBmaWxlIGNoYW5nZWQsIDIyIGluc2VydGlvbnMo
KyksIDQgZGVsZXRpb25zKC0pPGJyPg0KJmd0OyA8YnI+DQomZ3Q7IGRpZmYgLS1naXQgYS90ZXN0
Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoIGIvdGVzdGNhc2VzL2tlcm5lbC9udW1hL251bWEw
MS5zaDxicj4NCiZndDsgaW5kZXggMzMzOTNhYzhkLi43ZjNkZWU4NDkgMTAwNzU1PGJyPg0KJmd0
OyAtLS0gYS90ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoPGJyPg0KJmd0OyArKysgYi90
ZXN0Y2FzZXMva2VybmVsL251bWEvbnVtYTAxLnNoPGJyPg0KJmd0OyBAQCAtNTIsOSArNTIsMTgg
QEAgVFNUX05FRURTX0NNRFM9JnF1b3Q7YXdrIGJjIG51bWFjdGwgbnVtYXN0YXQmcXVvdDs8YnI+
DQomZ3Q7wqAgZXh0cmFjdF9udW1hc3RhdF9wKCk8YnI+DQomZ3Q7wqAgezxicj4NCiZndDvCoCDC
oCDCoCDCoGxvY2FsIHBpZD0kMTxicj4NCiZndDsgLcKgIMKgIMKgbG9jYWwgbm9kZT0kKCgkMiAr
IDIpKTxicj4NCiZndDsgLTxicj4NCiZndDsgLcKgIMKgIMKgZWNobyAkKG51bWFzdGF0IC1wICRw
aWQgfGF3ayAmIzM5Oy9eVG90YWwvIHtwcmludCAkJiMzOTskbm9kZSYjMzk7fSYjMzk7KTxicj4N
CiZndDsgK8KgIMKgIMKgbG9jYWwgbm9kZT0kMjxicj4NCiZndDsgKzxicj4NCiZndDsgK8KgIMKg
IMKgZWNobyAkKG51bWFzdGF0IC1wICRwaWQgfMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4N
CiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgYXdrIC12IG5vZGU9JG5vZGUgJiMzOTsvTm9kZS8g
e8KgIMKgIMKgXDxicj4NCiZndDsgK8KgIMKgIMKgIMKgIMKgIMKgIMKgZ3N1YigmcXVvdDtOb2Rl
JnF1b3Q7LCAmcXVvdDsmcXVvdDspO8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgXDxicj4NCiZndDsg
K8KgIMKgIMKgIMKgIMKgIMKgIMKgZm9yIChpPTA7IGkmbHQ7TkY7IGkrKynCoCDCoCDCoCDCoCDC
oCDCoCBcPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBpZiAoJGkg
PT0gbm9kZSnCoCDCoCDCoCDCoCDCoFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoGNvbD1pKzE7wqAgwqAgwqAgwqAgXDxicj4NCiZndDsgK8Kg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgbmV4dMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgIFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoH3CoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDC
oCDCoCDCoC9eVG90YWwvIHtwcmludCAkY29sfSYjMzk7wqAgwqAgwqAgwqAgwqAgXDxicj4NCiZn
dDsgK8KgIMKgIMKgKTxicj4NCiZndDvCoCB9PGJyPg0KPGJyPg0KSWYgd2UgY2FuIHVzZSBleHRy
YWN0X251bWFzdGF0X3AwIHdpdGggbm9kZV9pbmRleCB0aGVuIHRoZSBleGlzdGluZyBjb2RlPGJy
Pg0Kd29ya3MsIGZvciBleGFtcGxlIGlmIGNhbiBpbmRleCB3aGlsZSBpdGVyYXRpbmcgJG5vZGVf
bGlzdCBhbmQgdXNlIHRoaXM8YnI+DQp3aXRoIGV4dHJhY3RfbnVtYXN0YXRfcDAgdGhlbiBpdCBz
aG91bGQgd29yay48YnI+PC9ibG9ja3F1b3RlPjxkaXY+PGJyPjwvZGl2PjxkaXY+PGRpdiBjbGFz
cz0iZ21haWxfZGVmYXVsdCIgc3R5bGU9ImZvbnQtc2l6ZTpzbWFsbCI+SGkgQmFsYSw8L2Rpdj48
YnI+PC9kaXY+PGRpdj48ZGl2IGNsYXNzPSJnbWFpbF9kZWZhdWx0IiBzdHlsZT0iZm9udC1zaXpl
OnNtYWxsIj5Tb3JyeSwgSSBkb24mIzM5O3QgZnVsbHkgdW5kZXJzdGFuZCB3aGF0JiMzOTtzIHlv
dSBtZWFuIGhlcmUgOiguIENvdWxkIHlvdSBleHBsYWluIHNvbWV0aGluZyBtb3JlIGZvciB0aGlz
IG1ldGhvZD88L2Rpdj48L2Rpdj48ZGl2Pjxicj48L2Rpdj48ZGl2PsKgPC9kaXY+PGJsb2NrcXVv
dGUgY2xhc3M9ImdtYWlsX3F1b3RlIiBzdHlsZT0ibWFyZ2luOjBweCAwcHggMHB4IDAuOGV4O2Jv
cmRlci1sZWZ0OjFweCBzb2xpZCByZ2IoMjA0LDIwNCwyMDQpO3BhZGRpbmctbGVmdDoxZXgiPg0K
PGJyPg0KVGhpcyBpcyBqdXN0IG15IHRob3VnaHRzLCBwbGVhc2UgZmVlbCBmcmVlIHRvIGNvcnJl
Y3QgbWUgaWYgSSBtaXNzIG9yPGJyPg0KaXQgaXMgc29tZXRoaW5nIHdyb25nLiBUaGFua3MhPGJy
Pg0KPGJyPg0KLS0gQmFsYTxicj4NCiZndDvCoCA8YnI+DQomZ3Q7wqAgY2hlY2tfZm9yX3N1cHBv
cnRfbnVtYSgpPGJyPg0KJmd0OyBAQCAtMzYzLDcgKzM3MiwxNiBAQCB0ZXN0OSgpPGJyPg0KJmd0
O8KgIMKgIMKgIMKgIMKgIMKgIMKgIMKgcGlkPSQhPGJyPg0KJmd0O8KgIMKgIMKgIMKgIMKgIMKg
IMKgIMKgVFNUX1JFVFJZX0ZVTkMgJnF1b3Q7Y2hlY2tfZm9yX3N1cHBvcnRfbnVtYSAkcGlkJnF1
b3Q7IDA8YnI+DQomZ3Q7wqAgPGJyPg0KJmd0OyAtwqAgwqAgwqAgwqAgwqAgwqAgwqBNZW1faHVn
ZT0kKGVjaG8gJChudW1hc3RhdCAtcCAkcGlkIHxhd2sgJiMzOTsvXkh1Z2UvIHtwcmludCAkJiMz
OTskKChub2RlKzIpKSYjMzk7fSYjMzk7KSk8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDC
oE1lbV9odWdlPSQoZWNobyAkKG51bWFzdGF0IC1wICRwaWQgfMKgIMKgIFw8YnI+DQomZ3Q7ICvC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGF3ayAtdiBub2RlPSRub2RlICYjMzk7L05v
ZGUvIHvCoCDCoCDCoFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDC
oGdzdWIoJnF1b3Q7Tm9kZSZxdW90OywgJnF1b3Q7JnF1b3Q7KTvCoCDCoCDCoCDCoCDCoCDCoCDC
oCDCoFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoGZvciAoaT0w
OyBpJmx0O05GOyBpKyspwqAgwqAgwqAgwqAgwqAgwqAgXDxicj4NCiZndDsgK8KgIMKgIMKgIMKg
IMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgIMKgaWYgKCRpID09IG5vZGUpwqAgwqAgwqAg
wqAgwqBcPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqAgwqAgwqAgwqAgwqAgwqBjb2w9aSsxO8KgIMKgIMKgIMKgIFw8YnI+DQomZ3Q7ICvCoCDCoCDC
oCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoCDCoG5leHTCoCDCoCDCoCDCoCDCoCDC
oCDCoCDCoCDCoCDCoCBcPGJyPg0KJmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAg
wqB9wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBcPGJyPg0K
Jmd0OyArwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAgwqAvXkh1Z2UvIHtwcmludCAkY29s
fSYjMzk7KcKgIMKgIMKgIMKgIMKgIFw8YnI+DQomZ3Q7ICvCoCDCoCDCoCDCoCDCoCDCoCDCoCk8
YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBNZW1faHVnZT0kKCgke01lbV9odWdlJS4q
fSAqIDEwMjQpKTxicj4NCiZndDvCoCA8YnI+DQomZ3Q7wqAgwqAgwqAgwqAgwqAgwqAgwqAgwqBp
ZiBbICZxdW90OyRNZW1faHVnZSZxdW90OyAtbHQgJnF1b3Q7JEhQQUdFX1NJWkUmcXVvdDsgXTsg
dGhlbjxicj4NCiZndDsgLS0gPGJyPg0KJmd0OyAyLjIwLjE8YnI+DQomZ3Q7IDxicj4NCiZndDsg
PGJyPg0KJmd0OyAtLSA8YnI+DQomZ3Q7IE1haWxpbmcgbGlzdCBpbmZvOiA8YSBocmVmPSJodHRw
czovL2xpc3RzLmxpbnV4Lml0L2xpc3RpbmZvL2x0cCIgcmVsPSJub3JlZmVycmVyIiB0YXJnZXQ9
Il9ibGFuayI+aHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9sdHA8L2E+PGJyPg0KPGJy
Pg0KPC9ibG9ja3F1b3RlPjwvZGl2PjxiciBjbGVhcj0iYWxsIj48ZGl2Pjxicj48L2Rpdj4tLSA8
YnI+PGRpdiBkaXI9Imx0ciIgY2xhc3M9ImdtYWlsX3NpZ25hdHVyZSI+PGRpdiBkaXI9Imx0ciI+
PGRpdj5SZWdhcmRzLDxicj48L2Rpdj48ZGl2PkxpIFdhbmc8YnI+PC9kaXY+PC9kaXY+PC9kaXY+
PC9kaXY+DQo=
--0000000000005320c905886fc214--

--===============1312089652==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: inline

Ci0tIApNYWlsaW5nIGxpc3QgaW5mbzogaHR0cHM6Ly9saXN0cy5saW51eC5pdC9saXN0aW5mby9s
dHAK

--===============1312089652==--
