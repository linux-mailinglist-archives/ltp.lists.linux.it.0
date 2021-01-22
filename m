Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A3D12FFDB0
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:57:04 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id F1B833C6347
	for <lists+linux-ltp@lfdr.de>; Fri, 22 Jan 2021 08:57:03 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-3.smtp.seeweb.it (in-3.smtp.seeweb.it [217.194.8.3])
 by picard.linux.it (Postfix) with ESMTP id BDDA93C3026
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:56:59 +0100 (CET)
Received: from mx0a-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com
 [148.163.158.5])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-3.smtp.seeweb.it (Postfix) with ESMTPS id A057E1A01011
 for <ltp@lists.linux.it>; Fri, 22 Jan 2021 08:56:58 +0100 (CET)
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1])
 by mx0b-001b2d01.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id
 10M7WCoX142839; Fri, 22 Jan 2021 02:56:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com;
 h=date : message-id : from
 : to : cc : cc : subject : in-reply-to : in-reply-to : mime-version :
 content-type : references; s=pp1;
 bh=CQzmSPNWlJl02XgmQ7VirY9VHponZKxKnsKCkxGuBZI=;
 b=St+rjIhCoF2rw8YxWi3fI6IEFSSL6KaUi57H8V2NlwbdNUnLM7t6x6XqXbP6aw8w0vyB
 yx9o+lfIwnRl8VcVvXVUM1OIRHuPJ36+Uj2Pn3tUk0VKc3AzIje5t5hnrCOjJxvEVzOH
 Q6mmFB8oRV0ylCPwr6tOvdYyVFsq+dlXaTLEvyfEVTevnWtFKfgHWq97rbXxsNTecGjg
 niYEz5CHS1EZcqMdOcm4LoL7ccCeALv/G/0ywyDEmIBbEbQt8uwIGZBZng7ibrunbLia
 6WMfwqUIRXkRKgovj+fmHnZIBwjfiW4TYTKv+slE+3QAjkWmTCaj/LMl57ncEvF4Z8A2 2Q== 
Received: from pps.reinject (localhost [127.0.0.1])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367t6cgv35-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 02:56:56 -0500
Received: from m0098413.ppops.net (m0098413.ppops.net [127.0.0.1])
 by pps.reinject (8.16.0.36/8.16.0.36) with SMTP id 10M7YDQj151120;
 Fri, 22 Jan 2021 02:56:55 -0500
Received: from ppma06fra.de.ibm.com (48.49.7a9f.ip4.static.sl-reverse.com
 [159.122.73.72])
 by mx0b-001b2d01.pphosted.com with ESMTP id 367t6cgv2n-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 02:56:55 -0500
Received: from pps.filterd (ppma06fra.de.ibm.com [127.0.0.1])
 by ppma06fra.de.ibm.com (8.16.0.42/8.16.0.42) with SMTP id 10M7lRhJ014886;
 Fri, 22 Jan 2021 07:56:53 GMT
Received: from b06cxnps4074.portsmouth.uk.ibm.com
 (d06relay11.portsmouth.uk.ibm.com [9.149.109.196])
 by ppma06fra.de.ibm.com with ESMTP id 367k10r5ve-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Fri, 22 Jan 2021 07:56:53 +0000
Received: from b06wcsmtp001.portsmouth.uk.ibm.com
 (b06wcsmtp001.portsmouth.uk.ibm.com [9.149.105.160])
 by b06cxnps4074.portsmouth.uk.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 10M7updi42795480
 (version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Fri, 22 Jan 2021 07:56:51 GMT
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id 2E120A4062;
 Fri, 22 Jan 2021 07:56:51 +0000 (GMT)
Received: from b06wcsmtp001.portsmouth.uk.ibm.com (unknown [127.0.0.1])
 by IMSVA (Postfix) with ESMTP id D4F60A4064;
 Fri, 22 Jan 2021 07:56:50 +0000 (GMT)
Received: from oc8242746057.ibm.com (unknown [9.171.79.240])
 by b06wcsmtp001.portsmouth.uk.ibm.com (Postfix) with ESMTPS;
 Fri, 22 Jan 2021 07:56:50 +0000 (GMT)
Date: Fri, 22 Jan 2021 08:56:50 +0100
Message-Id: <87y2glxv3x.fsf@oc8242746057.ibm.com>
From: Alexander Egorenkov <egorenar@linux.ibm.com>
To: Li Wang <liwang@redhat.com>, Petr Vorel <pvorel@suse.cz>
In-Reply-To: <CAEemH2e=ySuT+JEoDkF0e0TYeooeZbT0mu4D+47NLjwvsPecnA@mail.gmail.com>
In-Reply-To: 
MIME-Version: 1.0
References: <20210115143246.369676-1-egorenar@linux.ibm.com>
 <CAEemH2fDzPp3D6KZ_G0UDbS=eh2tWDAcy7CTt_4Yw7FUT4zGxg@mail.gmail.com>
 <87zh14rrxm.fsf@oc8242746057.ibm.com> <YAgmPjaf8iRn20x2@pevik>
 <CAEemH2cseOGtSem9vhChygLNeYz6E0bVEu+u-UH8agLBoHJo4Q@mail.gmail.com>
 <CAEemH2e=ySuT+JEoDkF0e0TYeooeZbT0mu4D+47NLjwvsPecnA@mail.gmail.com>
X-TM-AS-GCONF: 00
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343, 18.0.737
 definitions=2021-01-22_03:2021-01-21,
 2021-01-22 signatures=0
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0
 adultscore=0 spamscore=0 mlxlogscore=999 lowpriorityscore=0
 impostorscore=0 malwarescore=0 bulkscore=0 mlxscore=0 phishscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.12.0-2009150000 definitions=main-2101220036
X-Virus-Scanned: clamav-milter 0.102.4 at in-3.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_EF,SPF_HELO_NONE,SPF_PASS autolearn=disabled version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-3.smtp.seeweb.it
Subject: Re: [LTP] [PATCH 1/1] swapping01: make test more robust
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
Cc: , LTP List <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hi Li,
Date: Fri, 22 Jan 2021 08:56:45 +0100
Message-ID: <87zh11xv42.fsf@oc8242746057.ibm.com>
X-Trend-IP-HD: ip=[9.171.79.240]sender=(egorenar@linux.ibm.com)recipient=<ltp@lists.linux.it;pvorel@suse.cz;liwang@redhat.com>

Li Wang <liwang@redhat.com> writes:

> Hi Alex, Petr,
>
> I'm going to apply Alex's patch after a round of testing[1].
> Because giving more time waiting for swap memory to
> settle is no harm to test, at least help to get rid of failures
> observed on LPAR so far.

Great, thank you very much :) I also think it shouldn't make the test
behave worse.

>
> But I still think the swapping01 not very precise to some degree.
> We probably need to rewrite it someday but currently, I have no better
> idea.

100% agree. It is very fragile. I was thinking maybe we could find out
how much swap space is assigned to a *particular* process, maybe something
in /proc/ can be used ?

>
> [1] Running a stress-ng to eat some available memory in the
> background, then swapping01 easily hit the heavy-swap issue.
> This could be proved that it influenced by deamon allocate/free
> memory during testing.
>
> # stress-ng to eat memory after starting swapping01
>

I also observed that with stress-ng.


Regards
Alex

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
