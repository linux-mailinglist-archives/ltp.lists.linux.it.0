Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [213.254.12.146])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CD64262E65
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 14:17:09 +0200 (CEST)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id CCA953C2C1D
	for <lists+linux-ltp@lfdr.de>; Wed,  9 Sep 2020 14:17:08 +0200 (CEST)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-5.smtp.seeweb.it (in-5.smtp.seeweb.it [217.194.8.5])
 by picard.linux.it (Postfix) with ESMTP id 37CEC3C180A
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 14:17:06 +0200 (CEST)
Received: from us-smtp-1.mimecast.com (us-smtp-2.mimecast.com [205.139.110.61])
 by in-5.smtp.seeweb.it (Postfix) with ESMTP id 56A25600058
 for <ltp@lists.linux.it>; Wed,  9 Sep 2020 14:17:05 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
 s=mimecast20190719; t=1599653824;
 h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
 in-reply-to:in-reply-to:references:references;
 bh=gVEfXhtbNaYVHaFG1XTmJ3vZR/IdUeKHq8IguXv7l4U=;
 b=OVnhYY2EuI7zh3LB9szR+GEgWMR0CmUrO8PwynnmUwHkMYGYvwMt2IKz/kZPN23mhd3Alj
 c84J8o+dTF7z3imppKSluWfbe/WC1mQcwID76N9W+E8GSZjp1j5zxVGkItEMcWB1IdPM6o
 azoh/DNBcvKKNGJiGi9y3fYwqVfbXi4=
Received: from mail-yb1-f200.google.com (mail-yb1-f200.google.com
 [209.85.219.200]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-480-O8LiWNo7MuKFCRSkR9Qn_Q-1; Wed, 09 Sep 2020 08:16:59 -0400
X-MC-Unique: O8LiWNo7MuKFCRSkR9Qn_Q-1
Received: by mail-yb1-f200.google.com with SMTP id a84so2205381ybb.9
 for <ltp@lists.linux.it>; Wed, 09 Sep 2020 05:16:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:references:in-reply-to:from:date
 :message-id:subject:to:cc;
 bh=gVEfXhtbNaYVHaFG1XTmJ3vZR/IdUeKHq8IguXv7l4U=;
 b=lBeazt9aN4rCcIYCHg817YUn0Kz3CaZFkNcqRljG3FBIHAwF+NiJEosrZCcYs2PcpR
 fKO+BkCDCt3Q/1BwTvdpFXSvZVU3bPXphehz0bBEhvAPOOhpy6uQcFNxRCP0laCq44FN
 OkCPuGOFrYk4O9ui5+rJYML4AoYpiVeU+gemONQaZCME8wTOBIQZeRMTdwt7s5WEDWFp
 27+bNMNTYVuXNCCHECjRRYaHuS/AmfaLM6JSaf4wRCKFS70dJjjE19Ii0aask8b1/MJf
 eLsojylvjnApapQMDSBFvtqfPQMuw29OQXIpHM7JVNgoreZjs54aqeUpT31PJ5UXEOPy
 214A==
X-Gm-Message-State: AOAM532hEFbJF2QoaZEZVasPsMt/jQOu8lGZ0Sn5ln4/Nd64Abd/0Okt
 hHrkDWsPahfzJxN9H6FNPVo21HGI+r/21z/KB3VlGkzzKz9ptKiPHYl7RgkYM5KxTNjxJ0pjRcB
 7fw9S/at2hlTAdgsulvNvSoyqcW0=
X-Received: by 2002:a25:902:: with SMTP id 2mr4957614ybj.366.1599653818874;
 Wed, 09 Sep 2020 05:16:58 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwALFwKOyF1AOrOKZdyPT6JPaytn+a1x0mnrmW8G+Rx2/pi6kjEKWKyGq2JaQrSYXu05RDbPXaX0kWaSNCTriA=
X-Received: by 2002:a25:902:: with SMTP id 2mr4957596ybj.366.1599653818641;
 Wed, 09 Sep 2020 05:16:58 -0700 (PDT)
MIME-Version: 1.0
References: <20200908073138.GB2475@yuki.lan>
 <CAEemH2cHvM_KD7W6fyX6z3bc0qfVtkp=yEM8MDvvohouyj5N2w@mail.gmail.com>
 <20200908153659.GA16066@yuki.lan>
 <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
In-Reply-To: <CAEemH2eq0fwF8zt1uez5vuwM0vtrLtoFd_45sFqE=iQ8hpudfQ@mail.gmail.com>
From: Li Wang <liwang@redhat.com>
Date: Wed, 9 Sep 2020 20:16:47 +0800
Message-ID: <CAEemH2es3sMSfAar8Xj4_Vr+2nsD0isPws4v=8=csLyYROAQGQ@mail.gmail.com>
To: Cyril Hrubis <chrubis@suse.cz>,
 "Pravin Raghul S." <pravinraghul@zilogic.com>, 
 "Vijay Kumar B." <vijaykumar@zilogic.com>
Authentication-Results: relay.mimecast.com;
 auth=pass smtp.auth=CUSA124A263 smtp.mailfrom=liwan@redhat.com
X-Mimecast-Spam-Score: 0.001
X-Mimecast-Originator: redhat.com
X-Virus-Scanned: clamav-milter 0.102.4 at in-5.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,HTML_MESSAGE,SPF_HELO_NONE,SPF_PASS
 autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-5.smtp.seeweb.it
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
Cc: LTP List <ltp@lists.linux.it>
Content-Type: multipart/mixed; boundary="===============0512051195=="
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

--===============0512051195==
Content-Type: multipart/alternative; boundary="0000000000009fc37305aee06dda"

--0000000000009fc37305aee06dda
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 9, 2020 at 4:46 PM Li Wang <liwang@redhat.com> wrote:

>
>
> On Tue, Sep 8, 2020 at 11:36 PM Cyril Hrubis <chrubis@suse.cz> wrote:
>
>> Hi!
>> > And I'd like to add the MAP_GROWSDOWN test too, but I haven't come up
>> with
>> > a way to solve the segment fault on s390x.
>> > http://lists.linux.it/pipermail/ltp/2020-August/018416.html
>>
>> Maybe we end up allocating a mapping that is too close to something
>> else, see:
>>
>>
>> https://stackoverflow.com/questions/56888725/why-is-map-growsdown-mapping-does-not-grow
>>
>> I guess that we should make the initial mmap in find_free_range() larger
>> and return and adress that is quaranteed not to have a mapping that is
>> closer than 256 pages in the direction we want to grow.
>>
>
> Sounds reasonable. I tried to reserve more space for the mapping grows,
> and that works for me:).
>

To precisely, we could reserve 256 pages size at the end of the free-range
memory to let the stack keep away from a preceding mapping in its growing
then.
(my only concern is the stack_guard_gap can be changed via kernel command
line, but I assume that happen rarely, so here use the default 256 pages)

If there is no objection, I'd make these changes in patch V4.

--------

static void *find_free_range(size_t size)
{
    void *mem;
    long stack_guard_gap = 256 * getpageszie();

    /*
    * Since the newer kernel does not allow a MAP_GROWSDOWN mapping to grow
    * closer than stack_guard_gap pages away from a preceding mapping.
    * The guard then ensures that the next-highest mapped page remains more
    * than stack_guard_gap below the lowest stack address, and if not then
    * it will trigger a segfault. So, here let's reserve 256 pages memory
    * spacing for stack growing safely.
    */
    mem = SAFE_MMAP(NULL, size + stack_guard_gap, PROT_READ | PROT_WRITE,
                      MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
    SAFE_MUNMAP(mem, size + stack_guard_gap);

    return mem;
}

static void split_unmapped_plus_stack(void *start, size_t size)
{
    /* start           start + size
    * +---------------------+----------------------+-----------+
    * + unmapped            | mapped               | 256 pages |
    * +---------------------+----------------------+-----------+
    *                       stack
    */
    stack = SAFE_MMAP(start + size, size, PROT_READ | PROT_WRITE,
                             MAP_FIXED | MAP_PRIVATE | MAP_ANONYMOUS |
MAP_GROWSDOWN,
                             -1, 0);
}

-- 
Regards,
Li Wang

--0000000000009fc37305aee06dda
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div dir=3D"ltr"><div class=3D"gmail_default" style=3D"fon=
t-size:small"><br></div></div><br><div class=3D"gmail_quote"><div dir=3D"lt=
r" class=3D"gmail_attr">On Wed, Sep 9, 2020 at 4:46 PM Li Wang &lt;<a href=
=3D"mailto:liwang@redhat.com">liwang@redhat.com</a>&gt; wrote:<br></div><bl=
ockquote class=3D"gmail_quote" style=3D"margin:0px 0px 0px 0.8ex;border-lef=
t:1px solid rgb(204,204,204);padding-left:1ex"><div dir=3D"ltr"><div dir=3D=
"ltr"><div style=3D"font-size:small"><br></div></div><br><div class=3D"gmai=
l_quote"><div dir=3D"ltr" class=3D"gmail_attr">On Tue, Sep 8, 2020 at 11:36=
 PM Cyril Hrubis &lt;<a href=3D"mailto:chrubis@suse.cz" target=3D"_blank">c=
hrubis@suse.cz</a>&gt; wrote:<br></div><blockquote class=3D"gmail_quote" st=
yle=3D"margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padd=
ing-left:1ex">Hi!<br>
&gt; And I&#39;d like to add the MAP_GROWSDOWN test too, but I haven&#39;t =
come up with<br>
&gt; a way to solve the segment fault on s390x.<br>
&gt; <a href=3D"http://lists.linux.it/pipermail/ltp/2020-August/018416.html=
" rel=3D"noreferrer" target=3D"_blank">http://lists.linux.it/pipermail/ltp/=
2020-August/018416.html</a><br>
<br>
Maybe we end up allocating a mapping that is too close to something<br>
else, see:<br>
<br>
<a href=3D"https://stackoverflow.com/questions/56888725/why-is-map-growsdow=
n-mapping-does-not-grow" rel=3D"noreferrer" target=3D"_blank">https://stack=
overflow.com/questions/56888725/why-is-map-growsdown-mapping-does-not-grow<=
/a><br>
<br>
I guess that we should make the initial mmap in find_free_range() larger<br=
>
and return and adress that is quaranteed not to have a mapping that is<br>
closer than 256 pages in the direction we want to grow.<br></blockquote><di=
v><br></div><div style=3D"font-size:small">Sounds reasonable. I tried to re=
serve more space for the mapping grows, and that works for me:).</div></div=
></div></blockquote><div><br></div><div class=3D"gmail_default" style=3D"fo=
nt-size:small">To precisely, we could reserve 256 pages size at the end of =
the free-range</div><div class=3D"gmail_default" style=3D"font-size:small">=
memory to let the stack keep away from a preceding mapping in its growing</=
div><div class=3D"gmail_default" style=3D"font-size:small">then.</div><div =
class=3D"gmail_default" style=3D"font-size:small">(my only concern is the s=
tack_guard_gap can be changed via kernel command</div><div class=3D"gmail_d=
efault" style=3D"font-size:small">line, but I assume that happen rarely, so=
 here use the default 256 pages)</div><div class=3D"gmail_default" style=3D=
"font-size:small"><br></div><div class=3D"gmail_default" style=3D"font-size=
:small">If there is no objection, I&#39;d make these changes in patch V4.</=
div><div class=3D"gmail_default" style=3D"font-size:small"><br></div><div c=
lass=3D"gmail_default" style=3D"font-size:small">--------</div><div class=
=3D"gmail_default" style=3D"font-size:small"><br></div><div class=3D"gmail_=
default" style=3D"font-size:small">static void *find_free_range(size_t size=
)<br>{<br>=C2=A0 =C2=A0 void *mem;<br>=C2=A0 =C2=A0 long stack_guard_gap =
=3D 256 * getpageszie();<br><br>=C2=A0 =C2=A0 /*<br>=C2=A0 =C2=A0 * Since t=
he newer kernel does not allow a MAP_GROWSDOWN mapping to grow<br>=C2=A0 =
=C2=A0 * closer than stack_guard_gap pages away from a preceding mapping.<b=
r>=C2=A0 =C2=A0 * The guard then ensures that the next-highest mapped page =
remains more<br>=C2=A0 =C2=A0 * than stack_guard_gap below the lowest stack=
 address, and if not then<br>=C2=A0 =C2=A0 * it will trigger a segfault. So=
, here let&#39;s reserve 256 pages memory<br>=C2=A0 =C2=A0 * spacing for st=
ack growing safely.<br>=C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 mem =3D SAFE_MMAP(=
NULL, size + stack_guard_gap, PROT_READ | PROT_WRITE,<br>=C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 MAP_PRIVATE | M=
AP_ANONYMOUS, -1, 0);<br>=C2=A0 =C2=A0 SAFE_MUNMAP(mem, size + stack_guard_=
gap);<br><br>=C2=A0 =C2=A0 return mem;<br>}<br><br>static void split_unmapp=
ed_plus_stack(void *start, size_t size)<br>{<br>=C2=A0 =C2=A0 /* start =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 start + size<br>=C2=A0 =C2=A0 * +----------=
-----------+----------------------+-----------+<br>=C2=A0 =C2=A0 * + unmapp=
ed =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0| mapped =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 | 256 pages |<br>=C2=A0 =C2=A0 * +-------------=
--------+----------------------+-----------+<br>=C2=A0 =C2=A0 * =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 stack<br=
>=C2=A0 =C2=A0 */<br>=C2=A0 =C2=A0 stack =3D SAFE_MMAP(start + size, size, =
PROT_READ | PROT_WRITE,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0MAP_FIXED | MAP_PRI=
VATE | MAP_ANONYMOUS | MAP_GROWSDOWN,<br>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0=
 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0-1, 0=
);<br>}<br></div></div><div><br></div>-- <br><div dir=3D"ltr" class=3D"gmai=
l_signature"><div dir=3D"ltr"><div>Regards,<br></div><div>Li Wang<br></div>=
</div></div></div>

--0000000000009fc37305aee06dda--


--===============0512051195==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline


-- 
Mailing list info: https://lists.linux.it/listinfo/ltp

--===============0512051195==--

