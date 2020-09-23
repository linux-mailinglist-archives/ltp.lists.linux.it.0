Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id AC3E6275852
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:56:29 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 74DAB3C4D3C
	for <lists+linux-ltp@lfdr.de>; Wed, 23 Sep 2020 14:56:29 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::3])
 by picard.linux.it (Postfix) with ESMTP id 891C43C29DD
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:56:25 +0200 (CEST)
Received: from us-smtp-delivery-124.mimecast.com
 (us-smtp-delivery-124.mimecast.com [63.128.21.124])
 by in-3.smtp.seeweb.it (Postfix) with ESMTP id BBD021A0034A
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 14:56:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1600865783;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=McJZ6zEMChdrs2dX9PogwhrrDexax9o3+V0/qIP7vDo=;
 b=JizQcfxLUpCMzDk+P1GQQxPwUgZJ6moUbeKxW/Dm8jnRiSb5N7ffu7BMoWB2IXAaWJQwbV
 HvMR0p+w1qoHt65/2wlquabOUS2Gt39oV4Yd6qYz/UlJZ++/YWNHUVb7GgmixQc/1egWU8
 tWOttBVValWXKNyGTnXOokVIy2wwvV0=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-70-uY1yWOYtOKW1_KyhCNiUJQ-1; Wed, 23 Sep 2020 08:56:21 -0400
X-MC-Unique: uY1yWOYtOKW1_KyhCNiUJQ-1
Received: by mail-yb1-f200.google.com with SMTP id x10so18830008ybj.19
 for <ltp@lists.linux.it>; Wed, 23 Sep 2020 05:56:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=McJZ6zEMChdrs2dX9PogwhrrDexax9o3+V0/qIP7vDo=;
 b=bPXTsYDbOxTwhMHRIVnFI+bYLIaJrgnNfsmHsdO6Wr++nlnMP/oQgEKwXGMEYq1GQQ
 4dz6Q0W/vR2COjevt3wY3gnAaYWAvQn7xp8hT9xePYMssjeSjWzK2oXMgFoiT3Nd4Fq9
 jaezedviqy/Q1IZh/vVmxc5GtqKTd9FuWsfy8SRlGCFnd4xRrbtOG/C9FLvlf66ND49/
 HscgHzku7DmXcZAaqzu3GDY8Xxim/a6AdHo3/mBFIfiN/vC7VA+n5uknKwx+HcBBydmY
 MSb/yDIFxjXIEf2hzlVUDyNGfWmSiaOiJGEue/Y1VIM3tKP0FWoVpEzZQ8NVuwLce49U
 CgvQ==
X-Gm-Message-State: AOAM533dzAV2mwLBKx93paAHditFCCk4jW2hlywTasCaXV5DLTJkiUXv
 pssjIZFucciqpt/CuPM7uJRCeKbaYiMr0hyOBCKn+S357tQPXzWWtAIN/F3+STbsWN8KyNGdess
 MVsuBhdHXfnWptRT51QePNkdLLyg=
X-Received: by 2002:a25:606:: with SMTP id 6mr13953892ybg.86.1600865780645;
 Wed, 23 Sep 2020 05:56:20 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyZDeUNlOlJLjW/886vek10FpTM1YSjBxthtJDxbKDCWdqZNdcoQ2Jh/Y9erbVIMtos+u6Q7cX31x1ePXA5g80=
X-Received: by 2002:a25:606:: with SMTP id 6mr13953860ybg.86.1600865780363;
 Wed, 23 Sep 2020 05:56:20 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan> <20200922182102.GB12980@yuki.lan>
 <CAEemH2dFqYRNNSyhQ1bJ_L+wHFUQkOVBgdnm-_6Nqr4rP7UbBg@mail.gmail.com>
 <CAEemH2cxf2RQz5psmsaUsBHRrtayLJUVTfCo+NvevSyu7bLmvA@mail.gmail.com>
 <5F6B3E55.7020700@cn.fujitsu.com>
In-Reply-To: <5F6B3E55.7020700@cn.fujitsu.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 23 Sep 2020 20:56:07 +0800
Message-ID: <CAEemH2eUZ9Lr0zSMF-UAvO5QKL2W8L17jDYZLuyELzF5aKt-6g@mail.gmail.com>
To: Xiao Yang <yangx.jy@cn.fujitsu.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] LTP release
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
Cc: Filip.Bozuta@syrmia.com, LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============1364755262=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============1364755262==
Content-Type: multipart/alternative; boundary="0000000000002c127305affa9cb6"

--0000000000002c127305affa9cb6
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2020 at 8:24 PM Xiao Yang <yangx.jy@cn.fujitsu.com> wrote:

> =E4=BA=8E 2020/9/23 14:58, Li Wang =E5=86=99=E9=81=93:
>
>
> CC' people who touched the patches maybe give a hand.
>
> On Wed, Sep 23, 2020 at 2:50 PM Li Wang <liwang@redhat.com> wrote:
>
>>
>>
>> On Wed, Sep 23, 2020 at 2:20 AM Cyril Hrubis <chrubis@suse.cz> wrote:
>>
>>> Hi!
>>> As far as I can tell I've pushed the last patch that should have been i=
n
>>> the release just now. With that we should have a week worth of
>>> pre-release testing since we are aiming for a release at the end of the
>>> September. If you haven't tried LTP git HEAD yet, please do so now and
>>> report any problems you find.
>>>
>>
>> We still got this persistent fail on some kernels(RHEL8, kernel-v5.9-rc4=
):
>>
>> ---
>> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>> send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)
>>
>> ---
>> fanotify10.c:404: TFAIL: group 0 (4) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>> fanotify10.c:404: TFAIL: group 1 (4) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>> fanotify10.c:404: TFAIL: group 2 (4) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>> fanotify10.c:404: TFAIL: group 0 (0) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>> fanotify10.c:404: TFAIL: group 1 (0) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>> fanotify10.c:404: TFAIL: group 2 (0) got event: mask 1020 (expected 1000=
)
>> pid=3D95067 fd=3D12
>>
> Hi Li,
>
> I didn't reproduce the issue about fanotify10 on the lastest
> kernel(kernel-v5.9-rc6+):
>

Sorry for the unclear description.
The fanotify10 failed on RHEL8, I=E2=80=98m now trying to see if some kerne=
l patch
missing.
And send02 failed on kernel-v5.9-rc4.

--=20
Regards,
Li Wang

--0000000000002c127305affa9cb6
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 8:24 PM Xiao Yang &lt;<a hr=
ef=3D"mailto:yangx.jy@cn.fujitsu.com">yangx.jy@cn.fujitsu.com</a>&gt; wrote=
:<br></div><blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.=
8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex"><u></u>

 =20
   =20
 =20
  <div bgcolor=3D"#ffffff">
    =E4=BA=8E 2020/9/23 14:58, Li Wang =E5=86=99=E9=81=93:
    <blockquote type=3D"cite">
     =20
      <div dir=3D"ltr">
        <div dir=3D"ltr">
          <div style=3D"font-size:small"><br>
          </div>
          <div style=3D"font-size:small">CC&#39;=C2=A0people=C2=A0who
            touched the patches maybe give a hand.</div>
        </div>
        <br>
        <div class=3D"gmail_quote">
          <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2020 at 2:5=
0
            PM Li Wang &lt;<a href=3D"mailto:liwang@redhat.com" target=3D"_=
blank">liwang@redhat.com</a>&gt;
            wrote:<br>
          </div>
          <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8=
ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <div dir=3D"ltr">
              <div dir=3D"ltr">
                <div style=3D"font-size:small"><br>
                </div>
              </div>
              <br>
              <div class=3D"gmail_quote">
                <div dir=3D"ltr" class=3D"gmail_attr">On Wed, Sep 23, 2020
                  at 2:20 AM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@sus=
e.cz" target=3D"_blank">chrubis@suse.cz</a>&gt;
                  wrote:<br>
                </div>
                <blockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0=
px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
                  As far as I can tell I&#39;ve pushed the last patch that
                  should have been in<br>
                  the release just now. With that we should have a week
                  worth of<br>
                  pre-release testing since we are aiming for a release
                  at the end of the<br>
                  September. If you haven&#39;t tried LTP git HEAD yet,
                  please do so now and<br>
                  report any problems you find.<br>
                </blockquote>
                <div><br>
                </div>
                <div style=3D"font-size:small">We still got this
                  persistent fail on some kernels(RHEL8,
                  kernel-v5.9-rc4):</div>
                <div><br>
                </div>
                <div>---</div>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br=
>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br=
>
                send02.c:86: FAIL: recv() error: EAGAIN/EWOULDBLOCK (11)<br=
>
                <div style=3D"font-size:small">send02.c:86: FAIL: recv()
                  error: EAGAIN/EWOULDBLOCK (11)</div>
                <div style=3D"font-size:small"><br>
                </div>
                <div style=3D"font-size:small">---</div>
                <div style=3D"font-size:small">fanotify10.c:404: TFAIL:
                  group 0 (4) got event: mask 1020 (expected 1000)
                  pid=3D95067 fd=3D12<br>
                  fanotify10.c:404: TFAIL: group 1 (4) got event: mask
                  1020 (expected 1000) pid=3D95067 fd=3D12<br>
                  fanotify10.c:404: TFAIL: group 2 (4) got event: mask
                  1020 (expected 1000) pid=3D95067 fd=3D12<br>
                  fanotify10.c:404: TFAIL: group 0 (0) got event: mask
                  1020 (expected 1000) pid=3D95067 fd=3D12<br>
                  fanotify10.c:404: TFAIL: group 1 (0) got event: mask
                  1020 (expected 1000) pid=3D95067 fd=3D12<br>
                  fanotify10.c:404: TFAIL: group 2 (0) got event: mask
                  1020 (expected 1000) pid=3D95067 fd=3D12<br>
                </div>
              </div>
            </div>
          </blockquote>
        </div>
      </div>
    </blockquote>
    Hi Li,<br>
    <br>
    I didn&#39;t reproduce the issue about fanotify10 on the lastest
    kernel(kernel-v5.9-rc6+):<br></div></blockquote><div><br></div><div><di=
v class=3D"gmail_default" style=3D"font-size:small">Sorry for the unclear d=
escription.</div><div class=3D"gmail_default" style=3D"font-size:small">The=
 fanotify10 failed on RHEL8, I=E2=80=98m now trying to see if some kernel p=
atch missing.</div><div class=3D"gmail_default" style=3D"font-size:small">A=
nd send02 failed on kernel-v5.9-rc4.</div></div><div>=C2=A0</div></div>-- <=
br><div dir=3D"ltr" class=3D"gmail_signature"><div dir=3D"ltr"><div>Regards=
,<br></div><div>Li Wang<br></div></div></div></div>

--0000000000002c127305affa9cb6--


--===============1364755262==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============1364755262==--

