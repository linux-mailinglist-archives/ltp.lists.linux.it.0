Return-Path: <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>
X-Original-To: lists+linux-ltp@lfdr.de
Delivered-To: lists+linux-ltp@lfdr.de
Received: from picard.linux.it (picard.linux.it [IPv6:2001:1418:10:5::2])
	by mail.lfdr.de (Postfix) with ESMTPS id D14C7346512
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 17:27:32 +0100 (CET)
Received: from picard.linux.it (localhost [IPv6:::1])
	by picard.linux.it (Postfix) with ESMTP id 973493C7932
	for <lists+linux-ltp@lfdr.de>; Tue, 23 Mar 2021 17:27:32 +0100 (CET)
X-Original-To: ltp@lists.linux.it
Delivered-To: ltp@picard.linux.it
Received: from in-2.smtp.seeweb.it (in-2.smtp.seeweb.it
 [IPv6:2001:4b78:1:20::2])
 by picard.linux.it (Postfix) with ESMTP id 8BAF23C60C5
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 17:27:30 +0100 (CET)
Received: from aserp2120.oracle.com (aserp2120.oracle.com [141.146.126.78])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by in-2.smtp.seeweb.it (Postfix) with ESMTPS id 44853600297
 for <ltp@lists.linux.it>; Tue, 23 Mar 2021 17:27:29 +0100 (CET)
Received: from pps.filterd (aserp2120.oracle.com [127.0.0.1])
 by aserp2120.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NGPMMm007263;
 Tue, 23 Mar 2021 16:27:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=oracle.com;
 h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 content-id : content-transfer-encoding : mime-version; s=corp-2020-01-29;
 bh=iHqUI9WWVPGPLIAV7Xdj7MjSYcF1C0RCuhWgV524hoA=;
 b=irYxeeeoK23mRORVgLL0c8nETdq3e7Rry+KKx5L6g8qpRiJf/wKPVJd6wZpTKPpre6TB
 HXaCWFPVbueAkLalsNnsN0sjFAgZyEAVUadBNPSpssohzwIGfYwbkX6zZ/I23c+TL+c+
 NGebfZZ7AdiacwN1Q7RLGupaX7LaUYsy+Hy2e5j4pcsQMB127/ZSlB4Tk3tu8tUiaceq
 dAa+ARqX4QN60Evzi/0guauN4s1dOb6Rh08aRXUeOc3Vegh+DtaFO6FcKGMGJJtlA++z
 nhznAtmsyNMRttm1x3heM84YdTih2sQhMUMGkCBc1tfxdBx39k0tjFsfDA0M/qj0p+h0 TA== 
Received: from userp3020.oracle.com (userp3020.oracle.com [156.151.31.79])
 by aserp2120.oracle.com with ESMTP id 37d90mfqaq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 16:27:24 +0000
Received: from pps.filterd (userp3020.oracle.com [127.0.0.1])
 by userp3020.oracle.com (8.16.0.42/8.16.0.42) with SMTP id 12NGKBZj101513;
 Tue, 23 Mar 2021 16:27:23 GMT
Received: from nam10-bn7-obe.outbound.protection.outlook.com
 (mail-bn7nam10lp2107.outbound.protection.outlook.com [104.47.70.107])
 by userp3020.oracle.com with ESMTP id 37dtts5n8b-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
 Tue, 23 Mar 2021 16:27:23 +0000
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=d1TIOG+wBP9ynsKZfDVvxq2JvV2oBYX3RysbBJM7Iqx4HoA40RR8vAECDB4u9nVrSzCsvg2lZQeGTlxRtKGmqJ+xP38TpU7C/sSR+HzjUSvLSPJCamdJJB6E1Flte1kWAWV0ddLx/Y8bVc3zxvMYTn5y61nZf8Na3VK5vKUjmKYVBCL0W7cd1QxzxRsbHPFkkeqlK/WvyxBV8ok/xDbFqvmF48gNzhonpRusdJmZwvOvb9LJZz5BA4hPI2Q6pUZms/fLDw3HyfB06n8tk+gRxbSn2eZhAlCQ8/Zf3DVYFdm58JBzW85C38oSZm1rYrL+kK+Yb5lOYniga4mXMYgo5Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com; 
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHqUI9WWVPGPLIAV7Xdj7MjSYcF1C0RCuhWgV524hoA=;
 b=crhnXKyL0bwej2bhPX/IA46UGYjrk57MDwrEuYAVt3Tx1PGr7nm2+PvDcoSrBPU96FD/+hfwoBWPTEJT208/tcE7+oeeCJcS5192ahsuuNWHdWu5CIh9BGYwsMr+BvZCy14zc/mYHi86ZbLdHIErOxQFJoFjsg4c9g3tawLQ0tRFYULq83lEPiS4lAkljBfa52jg+IVTQu/96JyfTAaPqgZWuBKPAuf/VN28Pbw8tNiX+ObnY8EeQx6mXFHfjnj5KyxoTzMddQeayO8HvcM/tJzXv41Bg9fc68SQauI8b9HzRbhsEN9TSZQMgT7SSFGP6UYHSX0KN+yKUcplMxa20A==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=oracle.com; dmarc=pass action=none header.from=oracle.com;
 dkim=pass header.d=oracle.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oracle.onmicrosoft.com; s=selector2-oracle-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=iHqUI9WWVPGPLIAV7Xdj7MjSYcF1C0RCuhWgV524hoA=;
 b=F/Un/4fkOM2awCEQrpPLWtnoz5423Szkyjfy0VDBL7Lcuk8F6syT3DSasv/LTmcPhuxFee3qqN7ZmxO2i62WDVqAPcxQYX5ejZt4rTqazVtuxGbaUvUQdOXxEGj71OTRcdLyLtSmiLgFpd7K7uaHUUCvToraCWJGDzTeqo/xAn4=
Received: from MWHPR10MB1582.namprd10.prod.outlook.com (2603:10b6:300:22::8)
 by MWHPR10MB1310.namprd10.prod.outlook.com (2603:10b6:300:21::18) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.3955.18; Tue, 23 Mar
 2021 16:27:21 +0000
Received: from MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c]) by MWHPR10MB1582.namprd10.prod.outlook.com
 ([fe80::1ce7:260b:b004:c82c%11]) with mapi id 15.20.3955.027; Tue, 23 Mar
 2021 16:27:21 +0000
From: Liam Howlett <liam.howlett@oracle.com>
To: Li Wang <liwang@redhat.com>
Thread-Topic: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
Thread-Index: AQHXCvRm2LPXqQYmf0Wq1gEM3bkluaqIJcyAgAnHDgA=
Date: Tue, 23 Mar 2021 16:27:20 +0000
Message-ID: <20210323162714.t5dm5vbo35vl4t2l@revolver>
References: <20210224213114.2976705-1-Liam.Howlett@Oracle.com>
 <20210224213114.2976705-2-Liam.Howlett@Oracle.com>
 <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
In-Reply-To: <CAEemH2cKR98HvHZ6OYJpLpaX9-5hfhTak650=DtU-q2Yoo6kbA@mail.gmail.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
authentication-results: redhat.com; dkim=none (message not signed)
 header.d=none;redhat.com; dmarc=none action=none header.from=oracle.com;
x-originating-ip: [23.233.25.87]
x-ms-publictraffictype: Email
x-ms-office365-filtering-correlation-id: a436806c-0afa-47fb-450b-08d8ee188898
x-ms-traffictypediagnostic: MWHPR10MB1310:
x-microsoft-antispam-prvs: <MWHPR10MB1310989159C419BEF5DBC529FD649@MWHPR10MB1310.namprd10.prod.outlook.com>
x-ms-oob-tlc-oobclassifiers: OLM:9508;
x-ms-exchange-senderadcheck: 1
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: xS/g2bYebSfBIKt3hC3uogN9QWSa/Ybd1/lmtrIHP3yLh/cmHD5K/YP8fkZcdvhQBKNG0LqYk6YzvMdaLOLCniCYenvCy0EEnZ1hBpJ8fqJsipEILrPYKaiJqiZzZPNLhkCP9KFIVjjMK+QSrkrpyfB/LHttCYk82gylIv927jcot4vNt3QlPHYBa5RsmoRL2Dwhl6dVpFJWZKI4qmtymWNKLifsoO4BYcthrQZ9we9GliOs4RF0y4v0EqHYzuKtpgdVqeT67xq+BuQcH4QS7pGMgYs5YcxjzJc0nnDm3ISXiveso7squiFAsOchehXlAIbbhFRqWkieDbtzpT42wEU0kq3b39KjIVvUu5989AYfekeGFik3SmVTZckw+p5rF2Xwg4gKNybnSNgVIyYTLzdbNaf9m73yrq9CkiovafES6KwrnrA5AWXS26UBLweJ0pmksY3EnxMM2mQFCQZMP0m5kcOWB82Tj7nfzMoJ54neGgWum1d53eALpv6n7YwiDHPF87t5tANEqY7SwkUtDjCE0NMH1ma4R3YKn5c6wPDhmU3rnrYUexWMX2I9I/xmK9ej9kZ2ge7tKU/7C7V36NR712eN/cNWQX/yLlkU0knCRcdXJ46iouKmFzpQwKoLd7QskbsPbXlpcfG7Gtr4RQ==
x-forefront-antispam-report: CIP:255.255.255.255; CTRY:; LANG:en; SCL:1; SRV:;
 IPV:NLI; SFV:NSPM; H:MWHPR10MB1582.namprd10.prod.outlook.com; PTR:; CAT:NONE;
 SFS:(7916004)(396003)(366004)(39860400002)(136003)(346002)(376002)(6506007)(76116006)(1076003)(91956017)(6486002)(6916009)(26005)(6512007)(9686003)(86362001)(38100700001)(186003)(33716001)(5660300002)(316002)(66476007)(8936002)(71200400001)(83380400001)(66946007)(8676002)(66556008)(478600001)(4326008)(64756008)(2906002)(66446008)(44832011);
 DIR:OUT; SFP:1101; 
x-ms-exchange-antispam-messagedata: =?us-ascii?Q?4Y6lxYu0orGygu0KtEZ7zFbPcqgSNBBaHI98ciT0ubGPKqGjMQ7m9wfo6Adq?=
 =?us-ascii?Q?M3k93O/puGR43Enqw6I2/Jj6UOSttOWIV1EFUWBdVlhnqMEFj6onICUs2Uam?=
 =?us-ascii?Q?Yg+4cJg0xwm+i3D0GrLBNFbHx7sPrEwKt85mtGvTmVWGFAoYM4jow9QWK8xU?=
 =?us-ascii?Q?vZgOA7zPHa7gKLjUZruzc3f/LExYVJdnaDc9H9kkWVOBRVUdBGw3CP+fViLb?=
 =?us-ascii?Q?acvZ1EXI2QBUAyGGziz+F8tiabtBmlSqlINAKxPFPuy2MpWED6EpHA8B2xxm?=
 =?us-ascii?Q?fitMLaG2TeWjRRCHBppal1eNnUjuNdgl5nbN3s0knuVUJ5b3x8PP4Fmb5TVG?=
 =?us-ascii?Q?GBsWHB07dNtHjyGvYubydyo64NroEM8Bb052qferN9x62MbR3sMGJ28NZsJJ?=
 =?us-ascii?Q?3RKHpLp+GWxKfmP/Y7lsJRoQaT8/JeKz0XASE17/IbMBvMcWAUDOwaKzLktj?=
 =?us-ascii?Q?39KLY4oOUR7odPjS+xuHt2/Nnau7LNhS/sVnVGlt4FMdiDqCFkqG1dhnw/6R?=
 =?us-ascii?Q?4QN6HKYxi7tbtCT8JkcQCFoz36QyFrPkbkWmUXKOaFPUairOlyFCLW5o4mkN?=
 =?us-ascii?Q?h1FDMCMRZLvgDxsHs4odBtHGPVDhhGa+oiZXWt89c9RSbXEKUKAHpx3aPmCS?=
 =?us-ascii?Q?X8RDl1fU4zXqEGZET+uHYZcVcX0DmkSCJzteScnchIWvZRBtSnSmRLOORqBu?=
 =?us-ascii?Q?9vvRJBu0YNLNw+8bjiompIwCCBR7Orbiqgji6KoFAOstPWVD0iEjj/C6pqzw?=
 =?us-ascii?Q?mSX+2ip7HUQGQMcn/HS+5Hrrv+In0yBgGS92RrPjASp+pVz0V6zG3BegieJ0?=
 =?us-ascii?Q?rxJIuY0t6JAPFi16lhvthqF8q6MQLxCe/Fz9gAjdwnCts+aOJnx1tdQL0BUl?=
 =?us-ascii?Q?pT5PEYvGz9FinDHTGv+NBp/q22KYl5KHwjSn8qv9CFQabtzIV91GC//V3I8g?=
 =?us-ascii?Q?wYq/QY5hw5PWGRg3INksgki9yIi3PBta85cCjD26uHbtBB2xHQ+NWgXw+Jve?=
 =?us-ascii?Q?PSEcJC0y1QZ28qVqglwghCbcOZnZBUP2hGZxClQLUokjWr0PKsLrtyAhHPAW?=
 =?us-ascii?Q?7R7TI+c6wZnyMTgLC4bCB7ZJVCgBvbv3K3A5+WfO1+eTZJdGzmRqx7rGWGfB?=
 =?us-ascii?Q?1zIFyfO8XYH4V0uZ302TPU4acBQOw5+YpOtMOwUIUjJcKJdzVzp6tjdW1nOH?=
 =?us-ascii?Q?JqCyMDtXGs+7oqJS7Z5dZKRr3UgaDtwbplZ40olq0zsrHSOv3bZL0Fqj2YVV?=
 =?us-ascii?Q?ybyfa8tnIyNYJMe4MeDLHnmBRFiInMdpfF3YcaLElyPslqn4CyD69P1jieZp?=
 =?us-ascii?Q?uUUIFGzMhbs9zYHSMRzHgJBS?=
x-ms-exchange-transport-forked: True
Content-ID: <6AB67A4F3EBFCD46BBE0D1B24A405E8C@namprd10.prod.outlook.com>
MIME-Version: 1.0
X-OriginatorOrg: oracle.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: MWHPR10MB1582.namprd10.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: a436806c-0afa-47fb-450b-08d8ee188898
X-MS-Exchange-CrossTenant-originalarrivaltime: 23 Mar 2021 16:27:20.9472 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 4e2c6054-71cb-48f1-bd6c-3a9705aca71b
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 42dzUockWzWTHx/ktqBbbOa8ETkXXjwBLK+xnwCKaf185XWwnvHznVD0GZJScRaotoiiV/eEKShRr5FCtCSVHA==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: MWHPR10MB1310
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 spamscore=0
 mlxscore=0 phishscore=0 suspectscore=0 mlxlogscore=999 bulkscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230119
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=9932
 signatures=668683
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 adultscore=0
 malwarescore=0 mlxscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 lowpriorityscore=0
 phishscore=0 mlxlogscore=999 suspectscore=0 clxscore=1011 spamscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2009150000
 definitions=main-2103230119
X-Virus-Scanned: clamav-milter 0.102.4 at in-2.smtp.seeweb.it
X-Virus-Status: Clean
X-Spam-Status: No, score=0.1 required=7.0 tests=DKIM_SIGNED,DKIM_VALID,
 DKIM_VALID_AU,DKIM_VALID_EF,SPF_HELO_PASS,SPF_PASS autolearn=disabled
 version=3.4.4
X-Spam-Checker-Version: SpamAssassin 3.4.4 (2020-01-24) on in-2.smtp.seeweb.it
Subject: Re: [LTP] [PATCH v2 1/1] brk02: Add test for removing more than one
 VMA
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
Cc: "ltp@lists.linux.it" <ltp@lists.linux.it>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it
Sender: "ltp" <ltp-bounces+lists+linux-ltp=lfdr.de@lists.linux.it>

Hello Li,

Thank you for looking at this testcase.

* Li Wang <liwang@redhat.com> [210317 07:08]:
> Hi Liam, Petr,
> 
> Liam Howlett <liam.howlett@oracle.com> wrote:
> 
> 
> > ...
> > +       if (mprotect(addr - page_size, page_size,
> > +                    PROT_READ|PROT_WRITE|PROT_EXEC)) {
> > +               tst_res(TFAIL, "Cannot mprotect new VMA.");
> > +               return;
> > +       }
> >
> 
> We got permission denied here while performing the brk02 on
> x86_64/s390x(kernel-4.18~). After looking at the manual page of
> mprotect(), seems the access issue caused by PROT_EXEC.
> 
> "
> POSIX says that the behavior of mprotect() is unspecified if it is applied
> to a region of memory that was not obtained via mmap(2).
> ...
> Whether  PROT_EXEC has any effect different from PROT_READ
> depends on processor architecture, kernel version, and process state.
> If READ_IMPLIES_EXEC is set in the process's personality flags
> (see personality(2)), specifying PROT_READ will implicitly add PROT_EXEC.
> "


Unforntunately, dropping the PROT_EXEC causes the VMA behaviour to
change and does not test what this testcase is intended to test.

Removing the PROT_EXEC and the PROT_WRITE does test what is supposed to
be tested.  Can you verify that this works on the s390x?

Are you using real hardware to test this or can I use some sort of
emulation to test on my side?

Thank you,
Liam

-- 
Mailing list info: https://lists.linux.it/listinfo/ltp
